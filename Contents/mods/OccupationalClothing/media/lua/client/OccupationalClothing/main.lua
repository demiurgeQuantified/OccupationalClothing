local Json = require "Starlit/file/Json"
local DebugLog = require "Starlit/debug/DebugLog"
local TableUtils = require "Starlit/utils/TableUtils"

---@type table<string, true>?
local professionMap

---@class ItemDef
---@field tags table<string, true>? Lookup table of tags
---@field professions table<integer, string>? List of professions this item should be made available for

---@type table<string, ItemDef>
local clothing = {}

local OccupationalClothing = {}

local cacheProfessions = function()
    professionMap = {}
    local professions = ProfessionFactory.getProfessions()
    for i = 0, professions:size()-1 do
        ---@type Profession
        local profession = professions:get(i)
        professionMap[profession:getType()] = true
    end
end

---Reads a file and adds it to the cached changes. Clothing is not actually added until applyClothing() is called
---@param path string The filepath to read
OccupationalClothing.readFile = function(path)
    local fileData = Json.fromFile(path)
    if not fileData then DebugLog.log(DebugLog.LogLevel.DEBUG, "File %s not found or invalid", path); return end

    if fileData.version ~= "1.0" then DebugLog.log(DebugLog.LogLevel.WARN, "File %s has invalid version (%s)", path, fileData.version); return end

    if not professionMap then cacheProfessions() end

    local fileModule = fileData.module and fileData.module .. "." or "Base."
    for itemType,data in pairs(fileData.items) do
        if not string.match(itemType, "^.+%.") then
            itemType = fileModule .. itemType
        end

        data.tags = TableUtils.toLookup(data.tags)

        if not clothing[itemType] then
            clothing[itemType] = data
        else
            local entry = clothing[itemType]
            for tag,_ in pairs(data.tags) do
                entry.tags[tag] = true
            end

            local profMap = TableUtils.toLookup(entry.professions)
            for i = 1, #data.professions do
                local profession = data.professions[i]
                if not profMap[profession] then
                    table.insert(entry.professions, profession)
                end
            end
        end
    end
end

---Applies the cached clothing changes
OccupationalClothing.applyClothing = function()
    if not professionMap then cacheProfessions() end

    ---@type table<string, Item|false>
    local itemCache = {}

    ---@param type string
    ---@return Item|false
    local function getItem(type)
        if itemCache[type] == nil then
            itemCache[type] = ScriptManager.instance:getItem(type) or false
        end
        return itemCache[type]
    end

    for profession,_ in pairs(professionMap) do
        ClothingSelectionDefinitions[profession] = ClothingSelectionDefinitions[profession] or {Female = {}}
    end

    for itemType,data in pairs(clothing) do
        local item = getItem(itemType)
        if item then
            local bodyLocation = item:getBodyLocation()
            for j = 1, #data.professions do
                local profession = data.professions[j]
                if professionMap[profession] then
                    local profTable = ClothingSelectionDefinitions[profession].Female
                    profTable[bodyLocation] = profTable[bodyLocation] or {items = {}}
                    table.insert(profTable[bodyLocation].items, itemType)
                else
                    DebugLog.log(DebugLog.LogLevel.DEBUG, "Clothing item %s specifies unknown profession %s, ignoring", itemType, profession)
                end
            end
        else
            DebugLog.log(DebugLog.LogLevel.DEBUG, "Unknown clothing item %s, ignoring", itemType)
        end
    end
end

--- Frees resources not needed during gameplay
OccupationalClothing.free = function()
    professionMap = nil
    clothing = {}
end

Events.OnGameBoot.Add(function()
    OccupationalClothing.readFile("OccupationalClothing.json")
    -- this should be delayed until after the sandbox options are set
    OccupationalClothing.applyClothing()

    OccupationalClothing.free()
end)

return OccupationalClothing