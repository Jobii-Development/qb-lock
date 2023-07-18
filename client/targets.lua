local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function ()
    for robKey, rob in pairs(Config.milrobs) do
        exports['qb-target']:AddBoxZone(rob.name, rob.coords, rob.minZ, rob.maxZ, {
            name = rob.name,
            heading = rob.heading,
            debugPoly = Config.DebugPoly,
        }, {
            options = {
                {
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent("jd-mheist:client:startStealing", robKey, entity)
                    end,              
                    icon = rob.target_icon,
                    label = Lang:t(rob.target_label)
                },
            },
            distance = Config.boxDistance
        })
    end
end)
