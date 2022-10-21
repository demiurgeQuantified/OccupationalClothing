--[[OCCUPATIONAL CLOTHING
    Copyright (C) 2022 albion

    This program is free software: you can redistribute it and/or modify
    it under the terms of Version 3 of the GNU Affero General Public License as published
    by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    For any questions, contact me through steam or on Discord - albion#0123
]]
local Utils = {}

function Utils.addToCallbackTable(callbackTable, callback, condition)
    condition = condition or true
    table.insert(callbackTable, {condition, callback})
end

function Utils.handleCallbacks(callbacks, ...)
    local args = {...}
    for _,callbackTable in pairs(callbacks) do
        if type(callbackTable[1]) == 'function' then
            if callbackTable[1]() then callbackTable[2](unpack(args)) end
        elseif callbackTable[1] then callbackTable[2](unpack(args)) end
    end
end
return Utils