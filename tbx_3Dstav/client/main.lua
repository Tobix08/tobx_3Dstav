


local c = Config 
local lang = Languages[Config.languages] 
local peds = {}

local background = {
    enable = true,
    color = { r = 35, g = 35, b = 35, alpha = 200 },
}

local GetGameTimer = GetGameTimer





function draw3dText2(coords, text)
    SetTextScale(0.0, 0.5)
    SetTextFont(13)
    SetTextProportional(false)
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetDrawOrigin(coords, 0)
    SetTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 390
    DrawRect(0.0, 0.012+0.0101, 0.105+ factor, 0.03, 5, 5, 5, 170)
    ClearDrawOrigin()

end




local function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= c.dist and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer() + c.time,
            text = text
        }

        if not exists then
            local display = true

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0+0.01221)
                draw3dText2(pos, peds[ped].text)
                display = GetGameTimer() <= peds[ped].time
            end

            peds[ped] = nil
        end

    end
end


local function onShareDisplay(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, text)
    end
end


RegisterNetEvent('tbx_3Dstav:shareDisplay', onShareDisplay)


TriggerEvent('cc-chat:addSuggestion', '/' .. 'stav', 'momentalni stav se objevi nad vasi hlavou', 'npr."ma pripnotou sbran na opasku".')
