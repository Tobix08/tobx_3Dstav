
local lang = Languages[Config.language]

-- @desc Handle /me command
local function onMeCommand(source, args)
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    TriggerClientEvent('tbx_3Dstav:shareDisplay', -1, text, source)
end

-- Register the command
RegisterCommand(lang.commandName, onMeCommand)