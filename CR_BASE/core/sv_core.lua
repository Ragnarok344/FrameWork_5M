RegisterServerEvent('CR-Base:ServerStart')
AddEventHandler('CR-Base:ServerStart', function()
    print('Server Started')
    local civ = source
    citizen.createThread(function()
    local Identifier = GetPlayerIdentifiers(civ)[1] --Steam identifier
    if not Identifier then 
        DropPlayer(civ, 'No Identifier Found') --Kicks player if no identifier is found
    end
    return
end)
end)

RegisterNetEvent('CR-base:server:getObject')
AddEventHandler('CR-Base:server:getObject', function(callback)
    callback(CR)
    print('Called Back'..CR..)
end)
-- commands
AddEventHandler('CR-Base:addCommand', function(command, callback , suggestion , args))
    CR.Functions.addCommand(command, callback, suggestion, args)
    end)
end)

AddEventHandler('CR-Base:addGroupCommand', function(group, command, callback , suggestion , args))
    CR.Functions.addGroupCommand(group, command, callback, suggestion, args)
    end)
end)


--call back to server 
RegisterServerEvent('CR-base:Server.triggerServerCallback')
AddEventHandler('CR-base:Server.triggerServerCallback', function(Name, requestId, ...)
    local civ = source
    CR.functions.triggerServerCallback(civ, name, requestId, function(...)
        TriggerClientEvent('CR-base:client.triggerServerCallback', civ, requestId, ...)
    end, ...)
end)