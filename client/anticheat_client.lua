local isSpawned = false
local locale = LoadLocale() or {}

-- Cache player ped and coords
local playerPed = PlayerPedId()
local lastCoords = GetEntityCoords(playerPed)

-- Thread to update player ped and coords periodically
CreateThread(function()
  while true do
    Wait(300)
    local currentPed = PlayerPedId()
    if playerPed ~= currentPed then
      playerPed = currentPed
    end
    local currentCoords = GetEntityCoords(playerPed)
    if #(currentCoords - lastCoords) > 0.05 then
      lastCoords = currentCoords
    end
  end
end)

-- If txAdminAuth enabled, re-authenticate on client start
if wx.txAdminAuth then
  CreateThread(function()
    ExecuteCommand("txAdmin-reauth")
  end)
end

-- Register event to print debug messages
RegisterNetEvent("wx_anticheat:client:print")
AddEventHandler("wx_anticheat:client:print", function(msg)
  BetterPrint(msg, "debug")
end)

-- Register event to save client IDs
RegisterNetEvent("wx_anticheat:client:saveIds")
AddEventHandler("wx_anticheat:client:saveIds", function(ids)
  local license = GetResourceKvpString("license")
  if license then
    local savedIds = {
      steam = GetResourceKvpString("steam"),
      ip = GetResourceKvpString("ip"),
      discord = GetResourceKvpString("discord"),
      license = GetResourceKvpString("license"),
      fivem = GetResourceKvpString("fivem"),
      xbox = GetResourceKvpString("xbox"),
      live = GetResourceKvpString("live"),
      license2 = GetResourceKvpString("license2"),
      playerName = GetResourceKvpString("playerName")
    }
    TriggerServerEvent("wx_anticheat:server:verifyClientIds", savedIds)
    return
  end

  -- Save IDs to resource KVP if not already saved
  for k, v in pairs(ids) do
    SetResourceKvp(k, v)
  end
end)

-- On player spawn, check client IDs once
AddEventHandler("playerSpawned", function()
  if not isSpawned then
    isSpawned = true
    TriggerServerEvent("wx_anticheat:server:checkClientIds")
  end
end)

-- Ban player function with screenshot upload
function BanPlayer(reason, config)
  local screenshotUrl = nil
  exports[wx.screenshotModule].requestScreenshotUpload(GlobalState.OCRWebhook, "files[]", function(response)
    local data = json.decode(response)
    if data and data.attachments and data.attachments[1] and data.attachments[1].proxy_url then
      screenshotUrl = data.attachments[1].proxy_url
      if wx.Debug then
        BetterPrint(string.format("Detected for %s", reason), "debug")
      end
      TriggerServerEvent("wx_anticheat:addLog", "AntiCheat", string.format("Detected %s for %s", GetPlayerName(PlayerId()), reason), "debug")
      TriggerServerEvent(string.format("wx_anticheat:detect:client:%s", GlobalState.clientKey), reason, screenshotUrl, config)
    else
      TriggerServerEvent(string.format("wx_anticheat:detect:client:%s", GlobalState.clientKey), reason, screenshotUrl, config)
    end
  end)
end

-- Listen for detection events from server
RegisterNetEvent(string.format("wx_anticheat:detect:client:%s", GlobalState.clientKey))
AddEventHandler(string.format("wx_anticheat:detect:client:%s", GlobalState.clientKey), function(reason, config)
  BanPlayer(reason, config)
end)

-- Anti spoofed shot detection
if wx.antiSpoofedShot then
  AddEventHandler("gameEventTriggered", function(eventName, args)
    if eventName == "CEventNetworkEntityDamage" then
      local attacker = args[1]
      local victim = args[2]
      local weaponUsed = args[5]
      local selectedWeapon = GetSelectedPedWeapon(victim)
      if weaponUsed ~= selectedWeapon and selectedWeapon == -1569615261 and weaponUsed ~= -1569615261 then
        if victim == playerPed and not IsPedInAnyVehicle(playerPed, false) and IsPedStill(playerPed) and #tostring(attacker - victim) >= 10.0 then
          BanPlayer("SpoofedShot", "wx.antiSpoofedShot")
        end
      end
    end
  end)
end

-- Blacklisted client triggers detection
if wx.blacklistedEvents then
  for eventName, eventData in pairs(wx.triggerList) do
    if string.lower(eventData.type) == "client" then
      AddEventHandler(eventName, function()
        BanPlayer(string.format(wx.blacklistedTrigger, eventName), "wx.blacklistedEvents")
      end)
    end
  end
end

-- Check if any configured keys are pressed
function CheckKeystroke()
  for _, key in pairs(wx.detectedKeys) do
    if IsControlJustPressed(0, key) then
      return true
    end
  end
  return false
end

-- Anti overlay detection thread
CreateThread(function()
  local warningCount = 0
  local lastCheck = 0
  while wx.antiOverlay do
    Wait(0)
    if not warningCount and CheckKeystroke() then
      warningCount = 0
      while warningCount < 3 do
        Wait(5)
        if not IsPedStill(playerPed) then
          break
        end
        warningCount = warningCount + 1
        if warningCount >= 3 then
          BanPlayer(wx.detections.Overlay, "wx.antiOverlay")
          warningCount = nil
        end
      end
    end
    Wait(50)
  end
end)

-- Check if player is near whitelisted coords
function WlCoords()
  for _, coord in pairs(wx.whitelistedCoords) do
    if #(lastCoords - coord) < 30.0 then
      return true
    end
  end
  return false
end

-- Convert rotation vector to direction vector
function RotationToDirection(rot)
  local zRad = math.rad(rot.z)
  local xRad = math.rad(rot.x)
  local cosZ = math.abs(math.cos(xRad))
  local x = -math.sin(zRad) * cosZ
  local y = math.cos(zRad) * cosZ
  local z = math.sin(xRad)
  return vector3(x, y, z)
end

-- Additional anti-cheat checks and threads would follow here...
