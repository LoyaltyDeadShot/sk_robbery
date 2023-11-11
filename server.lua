ESX = exports["es_extended"]:getSharedObject()

local robberyCooldowns = {}

RegisterServerEvent('open_register')
AddEventHandler('open_register', function()
    local playerId = source

    if not robberyCooldowns[playerId] or (robberyCooldowns[playerId] and (GetGameTimer() - robberyCooldowns[playerId]) >= 1500000) then
        local success = math.random() <= 0.4
        local moneyAmount = success and math.random(50, 400) or 0

        TriggerClientEvent('start:robbery', source)
        Citizen.Wait(Config.Delay)
        TriggerClientEvent('give_money', playerId, moneyAmount, success)

        robberyCooldowns[playerId] = GetGameTimer()
    else
        TriggerClientEvent('robbery_cooldown', playerId)
    end
end)

RegisterServerEvent('add_money')
AddEventHandler('add_money', function(amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(amount)
end)