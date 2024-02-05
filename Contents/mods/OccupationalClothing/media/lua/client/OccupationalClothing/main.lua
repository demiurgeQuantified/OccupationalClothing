local Json = require "Starlit/file/Json"
local StarlitLog = require "Starlit/debug/StarlitLog"
local TableUtils = require "Starlit/utils/TableUtils"

local OccupationalClothing = {}

---@type table<string, table<string, table<string>>>?
local clothing

local initClothingTables = function()
    clothing = {}
    local professions = ProfessionFactory.getProfessions()
    for i = 0, professions:size()-1 do
        clothing[professions:get(i):getType()] = {}
    end
end

local log = StarlitLog.getLoggingFunction("OccupationalClothing")

---Reads a file and adds it to the cached changes. Clothing is not actually added until applyClothing() is called
---@param path string The filepath to read
OccupationalClothing.readFile = function(path)
    local fileData = Json.fromFile(path)
    if not fileData then log(StarlitLog.LogLevel.DEBUG, "File %s not found or invalid", path); return end

    if fileData.version ~= "1.0" then log(StarlitLog.LogLevel.WARN, "File %s has invalid version (%s)", path, fileData.version); return end

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
                for i = 1, #data.professions do
                    local profession = data.professions[i]
                    if clothing[profession] then
                        clothing[profession][itemType] = data.tags
                    else
                        log(StarlitLog.LogLevel.DEBUG, "Clothing item %s specifies unknown profession %s, ignoring", itemType, profession)
                    end
                end
            else
                log(StarlitLog.LogLevel.DEBUG, "Item %s is not wearable, ignoring", itemType)
            end
        else
            log(StarlitLog.LogLevel.DEBUG, "Unknown item %s, ignoring", itemType)
        end
    end
end

---Applies the cached clothing changes
---@param charCreation CharacterCreationMain
OccupationalClothing.injectClothing = function(charCreation)
    if CharacterCreationMain.debug then return end

    local profession = MainScreen.instance.desc:getProfession()
    if not (clothing and clothing[profession]) then return end

    local bannedTags = OccupationalClothing.getBannedTags()

    local t = {}
    for itemType,tags in pairs(clothing[profession]) do
        local shouldAddItem = true
        for i = 1, #tags do
            if bannedTags[tags[i]] then
                shouldAddItem = false
                break
            end
        end

        if shouldAddItem then
            local bodyLocation = ScriptManager.instance:getItem(itemType):getBodyLocation()
            t[bodyLocation] = t[bodyLocation] or {items = {}}

            table.insert(t[bodyLocation].items, itemType)
        end
    end

    charCreation:doClothingCombo(t, false)
end

---Returns a lookup table where banned tags resolve to true
---@return table<string, true>
OccupationalClothing.getBannedTags = function()
    -- TODO: there can definitely be a better API for custom tags than hooking this...
    local tags = {}
    if ZombRand(2) == 0 then
        tags["Hat"] = true
    end
    return tags
end

Events.OnGameBoot.Add(function()
    OccupationalClothing.readFile("OccupationalClothing.json")
end)

local old_initClothing = CharacterCreationMain.initClothing

function CharacterCreationMain:initClothing()
    old_initClothing(self)
    OccupationalClothing.injectClothing(self)
end

return OccupationalClothing