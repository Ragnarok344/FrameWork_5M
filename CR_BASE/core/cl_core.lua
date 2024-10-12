function CR.base.start(self)
    citizen.CreateThread(function()
    while true do
        if networkIsSessionStarted() then
            triggerEvent('CR-base:Start')
            triggerServerEvent('CR-Base:ServerStart')
            break
         end
      end  
  end)
end
CR.base.Start(self)

RegisterNetEvent('MP-Base:client:getObject')
AddEventHandler('MP-Base:client:getObject', function(callback)
    callback(CR)
    print('Called Back'..CR..)
end)