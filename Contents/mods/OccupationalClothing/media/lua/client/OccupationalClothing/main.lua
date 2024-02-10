local Json = require "Starlit/file/Json"
local StarlitLog = require "Starlit/debug/StarlitLog"
local TableUtils = require "Starlit/utils/TableUtils"

local OccupationalClothing = {}

---@type table<string, table<string, table<string, true>>>?
local clothing

-- Lookup table of already loaded file paths to ensure the same file doesn't load twice
local loadedFiles = {}

local initClothingTables = function()
    clothing = { __all = {} }
    local professions = ProfessionFactory.getProfessions()
    for i = 0, professions:size()-1 do
        clothing[professions:get(i):getType()] = {}
    end
end

local log = StarlitLog.getLoggingFunction("OccupationalClothing")

---Reads a file and adds its clothing to the table
---@param path string The filepath to read
---@param mod string? The id of the mod containing the file. Defaults to searching Zomboid/Lua/ instead
---@param mustExist boolean? If true, a warning will be raised if the file is missing. Defaults to false.
OccupationalClothing.readFile = function(path, mod, mustExist)
    local modName = mod or "UserDir"
    local uniqueID = string.format("%s (%s)", path, modName)

    if loadedFiles[uniqueID] then log(StarlitLog.LogLevel.WARN, "Tried to load file %s twice", uniqueID) return end
    loadedFiles[uniqueID] = true

    local fileData = Json.fromFile(path, mod)
    if not fileData then
        if mustExist then
            log(StarlitLog.LogLevel.DEBUG, "File %s missing or not a valid json file", uniqueID)
        end
        return
    end

    if fileData.version ~= "1.0" then log(StarlitLog.LogLevel.WARN, "File %s has invalid version (%s)", uniqueID, fileData.version); return end

    if fileData.files then
        for i = 1, #fileData.files do
            OccupationalClothing.readFile(fileData.files[i], mod)
        end
    end

    if not clothing then initClothingTables() end
    ---@cast clothing table<string, table<string, table<string, true>>>

    local fileModule = fileData.module and fileData.module .. "." or "Base."
    for itemType,data in pairs(fileData.items) do
        if not string.match(itemType, "^.+%.") then
            itemType = fileModule .. itemType
        end

        local item = ScriptManager.instance:getItem(itemType)
        if item then
            if item:getBodyLocation() ~= "" then
                local numProfessions = #data.professions
                if numProfessions < 1 then
                    clothing.__all[itemType] = data.tags or {}
                else
                    for i = 1, numProfessions do
                        local profession = data.professions[i]
                        if clothing[profession] then
                            clothing[profession][itemType] = data.tags or {}
                        else
                            log(StarlitLog.LogLevel.DEBUG, "Clothing item %s specifies unknown profession %s, ignoring", itemType, profession)
                        end
                    end
                end
            else
                log(StarlitLog.LogLevel.WARN, "Item %s is not wearable, ignoring", itemType)
            end
        else
            log(StarlitLog.LogLevel.DEBUG, "Unknown item %s, ignoring", itemType)
        end
    end
end

---Injects clothing into the CharacterCreationMain instance
---@param charCreation CharacterCreationMain
OccupationalClothing.injectClothing = function(charCreation)
    if CharacterCreationMain.debug then return end

    local profession = MainScreen.instance.desc:getProfession()
    if not (clothing and clothing[profession]) then return end

    local bannedTags = OccupationalClothing.getBannedTags()

    local additionalClothing = {}
    ---@param clothes table<string, table<string, true>>
    local function addClothes(clothes)
        for itemType,tags in pairs(clothes) do
            local shouldAddItem = true
            for i = 1, #tags do
                if bannedTags[tags[i]] then
                    shouldAddItem = false
                    break
                end
            end

            if shouldAddItem then
                local bodyLocation = ScriptManager.instance:getItem(itemType):getBodyLocation()
                additionalClothing[bodyLocation] = additionalClothing[bodyLocation] or {items = {}}

                table.insert(additionalClothing[bodyLocation].items, itemType)
            end
        end
    end

    addClothes(clothing[profession])
    addClothes(clothing.__all)

    charCreation:doClothingCombo(additionalClothing, false)
end

---Returns a lookup table where banned tags resolve to true
---@return table<string, true>
OccupationalClothing.getBannedTags = function()
    local tags = {}

    -- TODO: not sure how these are actually going to be set yet, sandbox options are the obvious fallback but something less hardcoded would be nice

    return tags
end

--ideally this should run later, as most mods add their professions during this event
--but they usually do that in shared, so they should all load first, so it should be fine for now?
Events.OnGameBoot.Add(function()
    if not isClient() then -- i don't think this can work in multiplayer, unless the server can send data before the player even loads the world?
        OccupationalClothing.readFile("OccupationalClothing.json")
    end

    OccupationalClothing.readFile("OccupationalClothing.json", "OccupationalClothing", true)

    ---@type table<integer, string>
    local mods = TableUtils.fromArray(getActivatedMods())
    table.remove(mods, TableUtils.find(mods, "OccupationalClothing")) -- remove main mod's file since it always loads first

    for i = 1, #mods do
        OccupationalClothing.readFile("OccupationalClothing.json", mods[i])
    end
end)

local old_initClothing = CharacterCreationMain.initClothing

---@diagnostic disable-next-line: duplicate-set-field
function CharacterCreationMain:initClothing()
    old_initClothing(self)
    OccupationalClothing.injectClothing(self)
end

return OccupationalClothing