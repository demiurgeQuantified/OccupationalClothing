local Json = require "Starlit/file/Json"
local StarlitLog = require "Starlit/debug/StarlitLog"
local TableUtils = require "Starlit/utils/TableUtils"

local OccupationalClothing = {}

---@type table<string, table<string, table<string, true>>>?
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
                local tags = TableUtils.toLookup(data.tags)
                for i = 1, #data.professions do
                    local profession = data.professions[i]
                    if clothing[profession] then
                        clothing[profession][itemType] = tags
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

    local t = {}
    for itemType,tags in pairs(clothing[profession]) do
        local item = ScriptManager.instance:getItem(itemType)
        local bodyLocation = item:getBodyLocation()
        t[bodyLocation] = t[bodyLocation] or {items = {}}

        table.insert(t[bodyLocation].items, itemType)
    end

    charCreation:doClothingCombo(t, false)
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