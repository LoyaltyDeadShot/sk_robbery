ESX = exports["es_extended"]:getSharedObject()

local modelcash = {759654580, -354930144, 303280717, 534367705, 892543765}

local optioncash = {
    {
        name = 'register_target', 
        onSelect = function()
            lib.showContext('register_1')
        end,
        icon = 'fa-solid fa-cash-register',
        label = Translation[Config.Locale]['target'],
        distance = 1.0,
    },
}

exports.ox_target:addModel(modelcash, optioncash)

lib.registerContext({
    id = 'register_1',
    title = Translation[Config.Locale]['register'],
    options = {
      {
        title = Translation[Config.Locale]['register_1'],
        description = Translation[Config.Locale]['register_1_d'],
        icon = 'fa-money-bill',
        onSelect = function()
          TriggerServerEvent('open_register')
        end,
      }
    }
  })

RegisterNetEvent('give_money')
AddEventHandler('give_money', function(amount, success)
    if success then
        TriggerServerEvent('add_money', amount)

        lib.notify({
            title = Translation[Config.Locale]['success1'],
            description = Translation[Config.Locale]['success2'] .. amount .. Translation[Config.Locale]['success3'],
            type = 'success'
        })
    else
        lib.notify({
            title = Translation[Config.Locale]['error_1'],
            description = Translation[Config.Locale]['error_1_d'],
            type = 'error'
        })
    end
end)

RegisterNetEvent('robbery_cooldown')
AddEventHandler('robbery_cooldown', function()
    lib.notify({
        title = Translation[Config.Locale]['info_1'],
        description = Translation[Config.Locale]['info_1_d'],
        type = 'inform'
    })
end)

RegisterNetEvent('start:robbery')
AddEventHandler('start:robbery', function()
    lib.progressCircle({
        duration = Config.Delay,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
        car = true,
        move = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
    })
end)