function NoPerms(src)
  TriggerClientEvent("__cfx_internal:serverPrint", src, "[ac.wx0.dev] You don't have permissions to use this command!")
end

function PrintToClient(src, message)
  TriggerClientEvent("wx_anticheat:client:print", src, message)
end
