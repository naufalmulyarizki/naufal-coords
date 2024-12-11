RegisterCommand(Config.Command, function() -- Register Command
    if Config.UseContext then -- Validasi apakah menggunakan menu context atau tidak
        local a = {
            {
                title = 'Copy Coords Vector 2',
                description = 'Klik untuk salin koordinat!',
                icon = 'clipboard',
                onSelect = function()
                    local coords = GetEntityCoords(cache.ped)
                    local vectorString = string.format("vector2(%f, %f)", coords.x, coords.y)
                    lib.setClipboard(vectorString)
                    lib.notify({
                        title = 'Koordinat',
                        description = 'Koordinat berhasil tersalin!',
                        showDuration = false,
                        position = 'top-right',
                        icon = 'clipboard',
                    })
                end
            },
            {
                title = 'Copy Coords Vector 3',
                description = 'Klik untuk salin koordinat!',
                icon = 'clipboard',
                onSelect = function()
                    local coords = GetEntityCoords(cache.ped)
                    local vectorString = string.format("vector3(%f, %f, %f)", coords.x, coords.y, coords.z)
                    lib.setClipboard(vectorString)
                    lib.notify({
                        title = 'Koordinat',
                        description = 'Koordinat berhasil tersalin!',
                        showDuration = false,
                        position = 'top-right',
                        icon = 'clipboard',
                    })
                end
            },
            {
                title = 'Copy Coords Vector 4',
                description = 'Klik untuk salin koordinat!',
                icon = 'clipboard',
                onSelect = function()
                    local coords = GetEntityCoords(cache.ped)
                    local heading = GetEntityHeading(cache.ped)
                    local vectorString = string.format("vector4(%f, %f, %f, %f)", coords.x, coords.y, coords.z, heading)
                    lib.setClipboard(vectorString)
                    lib.notify({
                        title = 'Koordinat',
                        description = 'Koordinat vector 4 berhasil tersalin!',
                        showDuration = false,
                        position = 'top-right',
                        icon = 'clipboard',
                    })
                end
            },
            {
                title = 'Heading',
                description = 'Klik untuk salin koordinat!',
                icon = 'clipboard',
                onSelect = function()
                    local heading = GetEntityHeading(cache.ped)
                    local vectorString = string.format("%f", heading)
                    lib.setClipboard(vectorString)
                    lib.notify({
                        title = 'Heading',
                        description = 'Heading berhasil tersalin!',
                        showDuration = false,
                        position = 'top-right',
                        icon = 'clipboard',
                    })
                end
            },
        }

        lib.registerContext({
            id = 'ctx_menu_copy_coords',
            title = 'Salin Koordinat',
            options = a
        })
        
        lib.showContext('ctx_menu_copy_coords')
    else
        lib.registerMenu({
            id = 'ctx_menu_copy_coords',
            title = 'Salin Koordinat',
            position = 'top-right',
            options = {
                {label = 'Copy Coords Vector 2', description = 'Tekan untuk salin koordinat!', icon = 'clipboard'},
                {label = 'Copy Coords Vector 3', description = 'Tekan untuk salin koordinat!', icon = 'clipboard'},
                {label = 'Copy Coords Vector 4', description = 'Tekan untuk salin koordinat!', icon = 'clipboard'},
                {label = 'Copy Heading', description = 'Tekan untuk salin koordinat!', icon = 'clipboard'},
            }
        }, function(selected, scrollIndex, args)
            if selected == 1 then
                local coords = GetEntityCoords(cache.ped)
                local vectorString = string.format("vector2(%f, %f)", coords.x, coords.y)
                lib.setClipboard(vectorString)
                lib.notify({
                    title = 'Koordinat',
                    description = 'Koordinat berhasil tersalin!',
                    showDuration = false,
                    position = 'top-right',
                    icon = 'clipboard',
                })
            elseif selected == 2 then
                local coords = GetEntityCoords(cache.ped)
                local vectorString = string.format("vector3(%f, %f, %f)", coords.x, coords.y, coords.z)
                lib.setClipboard(vectorString)
                lib.notify({
                    title = 'Koordinat',
                    description = 'Koordinat berhasil tersalin!',
                    showDuration = false,
                    position = 'top-right',
                    icon = 'clipboard',
                })
            elseif selected == 3 then
                local coords = GetEntityCoords(cache.ped)
                local heading = GetEntityHeading(cache.ped)
                local vectorString = string.format("vector4(%f, %f, %f, %f)", coords.x, coords.y, coords.z, heading)
                lib.setClipboard(vectorString)
                lib.notify({
                    title = 'Koordinat',
                    description = 'Koordinat vector 4 berhasil tersalin!',
                    showDuration = false,
                    position = 'top-right',
                    icon = 'clipboard',
                })
            elseif selected == 4 then
                local heading = GetEntityHeading(cache.ped)
                local vectorString = string.format("%f", heading)
                lib.setClipboard(vectorString)
                lib.notify({
                    title = 'Heading',
                    description = 'Heading berhasil tersalin!',
                    showDuration = false,
                    position = 'top-right',
                    icon = 'clipboard',
                })
            end
        end)

        lib.showMenu('ctx_menu_copy_coords')
    end
end)