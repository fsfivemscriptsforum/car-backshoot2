local restrictedAngles = {
    min = 120.0,
    max = 240.0
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed, false) then
            local camDir = GetGameplayCamRelativeHeading()

            if camDir < 0 then
                camDir = 360 + camDir
            end

            if camDir >= restrictedAngles.min and camDir <= restrictedAngles.max then
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                DisableControlAction(0, 68, true)
                DisableControlAction(0, 69, true)
                DisableControlAction(0, 70, true)
                DisableControlAction(0, 92, true)
                DisableControlAction(0, 114, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 331, true)

                if IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 25) then
                    BeginTextCommandThefeedPost("STRING")
                    AddTextComponentSubstringPlayerName("Nem tudsz hátrafelé lőni ❌")
                    EndTextCommandThefeedPostTicker(false, true)
                end
            end
        end
    end
end)