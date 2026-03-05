----ALL CREDITS TO SOL https://discord.gg/eB5Cnt8jAA
CreateThread(function()
    -- Send startup log to Discord
    if cfg.enableStartupLog and cfg.discordWebhook and cfg.discordWebhook ~= '' then
        local serverName = GetConvar('sv_hostname', 'Unknown Server')
        local resourceName = GetCurrentResourceName()
        local currentTime = os.date('%Y-%m-%d %H:%M:%S')
        
        local embed = {
            {
                ["title"] = "🟢 ID Card Script Started",
                ["description"] = "הסקריפט הופעל בהצלחה",
                ["color"] = 3066993, -- Green color
                ["fields"] = {
                    {
                        ["name"] = "שם השרת",
                        ["value"] = serverName,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "שם הסקריפט",
                        ["value"] = resourceName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "זמן הפעלה",
                        ["value"] = currentTime,
                        ["inline"] = true
                    }
                },
                ["footer"] = {
                    ["text"] = "ID Card System",
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }

        PerformHttpRequest(cfg.discordWebhook, function(err, text, headers) 
            if err == 200 or err == 204 then
                print('[sh-idcard] Startup log sent to Discord successfully')
            else
                print('[sh-idcard] Failed to send startup log to Discord. Error: ' .. tostring(err))
            end
        end, 'POST', json.encode({
            username = "ID Card Logger",
            embeds = embed
        }), { ['Content-Type'] = 'application/json' })
    end

    for cardName, data in pairs(cfg.cards) do
        if data.item then
            print('[sh-idcard] Registering item: ' .. data.item .. ' for card: ' .. cardName)
            if framework == 'esx' then --no metadata support
                CreateThread(function()
                    while not ESX do
                        Wait(0)
                    end

                    ESX.RegisterUsableItem(data.item, function(src)
                        local cardData = {
                            title = data.title,
                            titleColor = data.titleColor or 'green',
                            cardBackground = data.cardBackground,
                            fields = {}
                        }
                        if data.canShow and not data.canShow(src) then return false end
                        for _, field in ipairs(data.fields) do
                            cardData.fields[#cardData.fields + 1] = {
                                title = field.title,
                                value = editableFunctions(field.editableFunctionName, src)
                            }
                            if field.editableFunctionName == 'getGender' then
                                cardData.gender = cardData.fields[#cardData.fields].value
                                cardData.fields[#cardData.fields].value = sh._t(cardData.fields[#cardData.fields].value)
                            elseif field.editableFunctionName == 'getSignature' then
                                cardData.fields[#cardData.fields].isSignature = true
                            end
                        end
                        TriggerClientEvent('sh-idcard:client:showCard', src, cardData, true)
                    end)
                end)
            elseif framework == 'qb' then
                CreateThread(function()
                    while not QBCore do
                        Wait(0)
                    end

                    QBCore.Functions.CreateUseableItem(data.item, function(src, item)
                        local cardData = {
                            title = data.title,
                            titleColor = data.titleColor or 'green',
                            cardBackground = data.cardBackground,
                            fields = {}
                        }
                        if data.canShow and not data.canShow(src) then 
                            print('[sh-idcard] Player ' .. src .. ' tried to use ' .. data.item .. ' but canShow returned false')
                            TriggerClientEvent('QBCore:Notify', src, 'אין לך הרשאה להשתמש בפריט זה', 'error')
                            return false 
                        end
                        if data.useItemInfo then
                            local itemData = {
                                title = data.title,
                                cardBackground = data.cardBackground,
                                fields = {}
                            }
                            for _, field in ipairs(data.fields) do
                                if field.editableFunctionName == 'getSignature' then
                                    itemData.fields[#itemData.fields + 1] = {
                                        title = field.title,
                                        value = item[cfg.metadataKey].firstname .. item[cfg.metadataKey].lastname,
                                        isSignature = true
                                    }
                                else
                                    if field.itemInfoKey then
                                        itemData.fields[#itemData.fields + 1] = {
                                            title = field.title,
                                            value = item[cfg.metadataKey][field.itemInfoKey]
                                        }
                                        if field.itemInfoKey == 'gender' then
                                            itemData.gender = item[cfg.metadataKey][field.itemInfoKey] == 1 and 'female' or 'male'
                                            itemData.fields[#itemData.fields].value = sh._t(itemData.gender)
                                        end
                                    end
                                end
                            end
                            if item[cfg.metadataKey].firstname .. item[cfg.metadataKey].lastname == editableFunctions('getSignature', src) then
                                TriggerClientEvent('sh-idcard:client:showCard', src, itemData, true)
                            else
                                TriggerClientEvent('sh-idcard:client:showCard', src, itemData, false)
                            end
                        else
                            for _, field in ipairs(data.fields) do
                                cardData.fields[#cardData.fields + 1] = {
                                    title = field.title,
                                    value = editableFunctions(field.editableFunctionName, src)
                                }
                                if field.editableFunctionName == 'getGender' then
                                    cardData.gender = cardData.fields[#cardData.fields].value
                                    cardData.fields[#cardData.fields].value = sh._t(cardData.fields[#cardData.fields].value)
                                elseif field.editableFunctionName == 'getSignature' then
                                    cardData.fields[#cardData.fields].isSignature = true
                                end
                            end

                            TriggerClientEvent('sh-idcard:client:showCard', src, cardData, true)
                        end
                    end)
                end)
            end
        elseif data.command then
            RegisterCommand(data.command, function(src)
                local cardData = {
                    title = data.title,
                    titleColor = data.titleColor or 'green',
                    cardBackground = data.cardBackground,
                    fields = {}
                }
                if data.canShow and not data.canShow(src) then return false end
                for _, field in ipairs(data.fields) do
                    cardData.fields[#cardData.fields + 1] = {
                        title = field.title,
                        value = editableFunctions(field.editableFunctionName, src)
                    }
                    if field.editableFunctionName == 'getGender' then
                        cardData.gender = cardData.fields[#cardData.fields].value
                        cardData.fields[#cardData.fields].value = sh._t(cardData.fields[#cardData.fields].value)
                    elseif field.editableFunctionName == 'getSignature' then
                        cardData.fields[#cardData.fields].isSignature = true
                    end
                end
                TriggerClientEvent('sh-idcard:client:showCard', src, cardData, true)
            end)
        end
    end
end)
RegisterNetEvent('sh-idcard:server:showCard', function(players, data)
    local src = source
    local sourcePed = GetPlayerPed(src)
    local sourceCoords = GetEntityCoords(sourcePed)
    local alreadySent = {}
    
    -- Log card usage to Discord
    if cfg.enableUsageLog and cfg.discordWebhook and cfg.discordWebhook ~= '' then
        local playerName = GetPlayerName(src)
        local cardTitle = data.title or 'Unknown Card'
        local nearbyCount = #players
        
        CreateThread(function()
            local embed = {
                {
                    ["title"] = "📋 Card Displayed",
                    ["description"] = "שחקן הציג כרטיס",
                    ["color"] = 3447003, -- Blue color
                    ["fields"] = {
                        {
                            ["name"] = "שם השחקן",
                            ["value"] = playerName,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "סוג כרטיס",
                            ["value"] = cardTitle,
                            ["inline"] = true
                        },
                        {
                            ["name"] = "שחקנים בקרבת מקום",
                            ["value"] = tostring(nearbyCount),
                            ["inline"] = true
                        }
                    },
                    ["footer"] = {
                        ["text"] = "ID Card System",
                    },
                    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
                }
            }

            PerformHttpRequest(cfg.discordWebhook, function(err, text, headers) end, 'POST', 
                json.encode({
                    username = "ID Card Logger",
                    embeds = embed
                }), { ['Content-Type'] = 'application/json' })
        end)
    end
    
    for k, v in pairs(players) do
        if not alreadySent[v] then
            local playerPed = GetPlayerPed(v)
            local playerCoords = GetEntityCoords(playerPed)
            local dist = #(sourceCoords - playerCoords);
            if dist <= cfg.showDistance then
                TriggerClientEvent('sh-idcard:client:createCard', v, data)
                alreadySent[v] = true
            end
        end
    end
end)
