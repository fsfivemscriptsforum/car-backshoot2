local restrictedAngles = {
    min = 120.0,
    max = 240.0
}

lib.onCache('ped', function(playerPed)
    if not playerPed then return end

    while true do
        Wait(0)

        if IsPedInAnyVehicle(playerPed, false) then
            local camDir = (GetGameplayCamRelativeHeading() + 360) % 360

            if camDir >= restrictedAngles.min and camDir <= restrictedAngles.max then
                local controls = {24, 25, 68, 69, 70, 92, 114, 257, 331}
                for _, control in ipairs(controls) do
                    lib.disableControlAction(0, control, true)
                end

                if IsDisabledControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 25) then
                    lib.notify({
                        title = 'Figyelmeztetés',
                        description = 'Nem tudsz hátrafelé lőni ❌',
                        type = 'error'
                    })
                end
            end
        end
    end
