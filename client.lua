-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

RegisterCommand("debug", function()
    local auto = GetVehiclePedIsIn(PlayerPedId(), false)
    print(auto)
    local aheadVehHash = GetEntityModel(auto)
    local aheadVehName = GetDisplayNameFromVehicleModel(aheadVehHash)
    local aheadVehNameText = GetLabelText(aheadVehName)
    local tabela = dzwieki[aheadVehNameText]
    print(aheadVehNameText)
    print(tabela)
    for i,v in pairs(dzwieki) do
        if i == aheadVehNameText then
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, tabela, 1.0)
            print("znalazl")
        else
            print('difult')
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "default", 1.0)
          break
        end
      end
end)
