ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('codex_gangaim:aim')
AddEventHandler('codex_gangaim:aim', function()

local pedxd = GetPlayerPed( -1 )
	
if ( DoesEntityExist( pedxd ) and not IsEntityDead( pedxd ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "combat@aim_variations@1h@gang")
	   while ( not HasAnimDictLoaded( "combat@aim_variations@1h@gang" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
				ClearPedSecondaryTask(pedxd)
				else
				TaskPlayAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
            end 
		end )
	end
end )

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)


        if IsControlJustPressed(0, 197) then

            if PlayerData.job and (PlayerData.job.name == "grove" or PlayerData.job.name == "ballas" or PlayerData.job.name == "vagos" or PlayerData.job.name == "aztecas" or PlayerData.job.name == "bloods" or PlayerData.job.name == "crips" or PlayerData.job.name == "marabunta" or PlayerData.job.name == "vagos2") then
                TriggerEvent( 'codex_gangaim:aim', source )
                ESX.ShowNotification('Gang Aim Modu Değiştirildi.') 
            else
                ESX.ShowNotification('Bir gang üyesi olmalısın!') 
            end

        end
    end
end)