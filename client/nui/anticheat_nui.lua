-- Check if AdminMenu is enabled
if not wx.AdminMenu.enable then
  return
end

local isMenuOpen = false
local stats = {}

-- Add chat suggestion for /wx command
TriggerEvent("chat:addSuggestion", "/wx", "[ac.wx0.dev] Open admin panel")

-- Listen for stats sync from server
RegisterNetEvent("wx_anticheat:nui:getStats")
AddEventHandler("wx_anticheat:nui:getStats", function(data)
  stats = data
end)

-- Periodically request stats from server if menu is open
CreateThread(function()
  while true do
    Wait(2500)
    if isMenuOpen then
      TriggerServerEvent("wx_anticheat:nui:fetchStats")
    end
  end
end)

-- Helper to send NUI messages
function SendNuiAction(action, data)
  SendNUIMessage({ action = action, data = data })
end

-- Set NUI focus and visibility
function SetMenuVisibility(visible)
  SetNuiFocus(visible, visible)
  SendNuiAction("setVisibility", visible)
  isMenuOpen = visible
end

-- NUI callback to hide menu
RegisterNUICallback("hide", function(_, cb)
  SetMenuVisibility(false)
  cb({})
end)

-- Open admin menu event
RegisterNetEvent("wx_anticheat:openAdminMenu")
AddEventHandler("wx_anticheat:openAdminMenu", function(open)
  if open then
    SetMenuVisibility(true)
  end
end)

-- NUI callback to get player name
RegisterNUICallback("getPlayerName", function(_, cb)
  cb(GetPlayerName(PlayerId()))
end)

-- NUI callback to check if player is in vehicle
RegisterNUICallback("isInVehicle", function(_, cb)
  cb(IsPedInAnyVehicle(PlayerPedId(), false))
end)

-- NUI callback to get player's vehicle
RegisterNUICallback("getVehicle", function(_, cb)
  cb(GetVehiclePedIsIn(PlayerPedId(), false))
end)

-- NUI callback to get vehicle health
RegisterNUICallback("getVehicleHealth", function(data, cb)
  cb(GetVehicleBodyHealth(data.veh))
end)

-- NUI callback to repair vehicle
RegisterNUICallback("repairVehicle", function(data, cb)
  SetVehicleFixed(data.veh)
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), "Repaired their vehicle", "Success")
  cb(true)
end)

-- NUI callback to refill armor
RegisterNUICallback("refillArmor", function(_, cb)
  local ped = PlayerPedId()
  if GetPedArmour(ped) > 99 then
    return cb(false)
  end
  SetPedArmour(ped, 100)
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), "Refilled their armor", "Success")
  cb(true)
end)

-- NUI callback to refill health
RegisterNUICallback("refillHealth", function(_, cb)
  local ped = PlayerPedId()
  SetEntityHealth(ped, GetEntityMaxHealth(ped))
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), "Replenished their health", "Success")
  cb(true)
end)

-- NUI callback to check if health is max
RegisterNUICallback("maxHealth", function(_, cb)
  local ped = PlayerPedId()
  cb(GetEntityMaxHealth(ped) == GetEntityHealth(ped))
end)

-- NUI callbacks to delete entities and log actions
local function DeleteEntities(eventName, logMessage, cb)
  TriggerServerEvent(eventName)
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), logMessage, "Success")
  cb(true)
end

RegisterNUICallback("deleteAllPeds", function(_, cb)
  DeleteEntities("wx_anticheat:deletePeds", "Deleted all peds", cb)
end)

RegisterNUICallback("deleteAllObjects", function(_, cb)
  DeleteEntities("wx_anticheat:deleteObjects", "Deleted all objects", cb)
end)

RegisterNUICallback("deleteAllVehicles", function(_, cb)
  DeleteEntities("wx_anticheat:deleteVehicles", "Deleted all vehicles", cb)
end)

RegisterNUICallback("deleteEverything", function(_, cb)
  DeleteEntities("wx_anticheat:deleteAll", "Deleted everything", cb)
end)

-- NUI callback to spawn vehicle
RegisterNUICallback("spawnVehicle", function(data, cb)
  local model = data.model
  if not IsModelValid(model) then
    return
  end

  RequestModel(model)
  while not HasModelLoaded(model) do
    Wait(5)
  end

  local playerPed = PlayerPedId()
  local coords = GetEntityCoords(playerPed)
  local vehicle = CreateVehicle(model, coords, 0.0, true, true)

  -- Apply some default mods
  SetVehicleMod(vehicle, 11, 1, false)
  SetVehicleMod(vehicle, 12, 1, false)
  SetVehicleMod(vehicle, 13, 1, false)
  SetVehicleMod(vehicle, 17, 1, false)
  SetVehicleMod(vehicle, 18, 1, false)

  -- Warp player into vehicle
  for _ = 1, 2000 do
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    if GetVehiclePedIsIn(playerPed, false) == vehicle then
      break
    end
    Wait(0)
  end

  SetEntityAsNoLongerNeeded(vehicle)

  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), "Spawned vehicle " .. model, "Success")
  cb(true)
end)

-- NUI callback to check if model is valid vehicle
RegisterNUICallback("isModelValid", function(data, cb)
  cb(IsModelAVehicle(GetHashKey(data.model)))
end)

-- Screenshot handling
local screenshotUrl = nil

RegisterNetEvent("wx_anticheat:screenshotPlayer")
AddEventHandler("wx_anticheat:screenshotPlayer", function()
  local startTime = GetGameTimer()
  local success = false
  local screenshotModule = exports[wx.screenshotModule]

  screenshotModule.requestScreenshotUpload(GlobalState.OCRWebhook, "files[]", function(response)
    local data = json.decode(response)
    if data and data.attachments and data.attachments[1] and data.attachments[1].proxy_url then
      screenshotUrl = data.attachments[1].proxy_url
      TriggerServerEvent("wx_anticheat:syncScreenshot", screenshotUrl)
      success = true
    end
  end)

  while not success do
    if GetGameTimer() - startTime > wx.AdminMenu.screenshotTimeout * 1000 then
      break
    end
    Wait(100)
  end
end)

RegisterNetEvent("wx_anticheat:syncScreenshot")
AddEventHandler("wx_anticheat:syncScreenshot", function(url)
  screenshotUrl = url
end)

-- NUI callback to request screenshot
RegisterNUICallback("requestScreenshot", function(data, cb)
  TriggerServerEvent("wx_anticheat:requestPlayerScreenshot", data.id)
  Citizen.Wait(1000)
  if screenshotUrl then
    cb(tostring(screenshotUrl))
    screenshotUrl = nil
  else
    cb("error")
  end
end)

-- NUI callbacks to get counts and players
RegisterNUICallback("getPlayerCount", function(_, cb)
  cb(stats.playerCount)
end)

RegisterNUICallback("getAdminCount", function(_, cb)
  cb(stats.adminCount)
end)

RegisterNUICallback("getCheaterCount", function(_, cb)
  cb(stats.bannedCount)
end)

RegisterNUICallback("getPlayers", function(_, cb)
  cb(stats.players)
end)

-- Sync players list from server
RegisterNetEvent("wx_anticheat:syncPlayers")
AddEventHandler("wx_anticheat:syncPlayers", function(players)
  if players == players then -- redundant check, can be removed
    return
  end
  players = players
end)

-- NUI callback to ban player
RegisterNUICallback("banPlayer", function(data, cb)
  TriggerServerEvent("wx_anticheat:nui:ban", data.playerId, data.reason)
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), string.format("Banned player ID %s", data.playerId), "Success")
  cb(true)
end)

-- Sync identifiers from server
local identifiers = nil
RegisterNetEvent("wx_anticheat:syncIdentifiers")
AddEventHandler("wx_anticheat:syncIdentifiers", function(data)
  identifiers = data
end)

-- NUI callback to request identifiers
RegisterNUICallback("requestIdentifiers", function(data, cb)
  local playerId = data.id
  local attempts = 0
  TriggerServerEvent("wx_anticheat:GetPlayerIdentifiers", playerId)
  TriggerServerEvent("wx_anticheat:addLog", GetPlayerName(PlayerId()), string.format("Requested IDs of player ID %s", playerId), "Success")

  while not identifiers do
    Wait(100)
    attempts = attempts + 1
    if attempts > 10 then
      cb("error")
      return
    end
  end

  cb(identifiers)
  identifiers = nil
end)

-- Ban list cache
local banList = {}
TriggerServerEvent("wx_anticheat:getBanList")

RegisterNetEvent("wx_anticheat:syncBans")
AddEventHandler("wx_anticheat:syncBans", function(data)
  banList = data
end)

-- NUI callback to get ban list
RegisterNUICallback("getBans", function(_, cb)
  TriggerServerEvent("wx_anticheat:getBanList")
  cb(banList)
end)

-- NUI callback to unban player
RegisterNUICallback("unbanPlayer", function(data, cb)
  TriggerServerEvent("wx_anticheat:unban", data.banId)
  TriggerServerEvent("wx_anticheat:addLog", data.src, "Unbanned player " .. data.playerName, "Success")
  TriggerServerEvent("wx_anticheat:getBanList")
  cb(true)
end)

-- Logs cache
local logs = {}

RegisterNetEvent("wx_anticheat:syncLogs")
AddEventHandler("wx_anticheat:syncLogs", function(data)
  logs = data
end)

-- NUI callback to get logs
RegisterNUICallback("getLogs", function(_, cb)
  TriggerServerEvent("wx_anticheat:getLogs")
  cb(logs)
end)

-- NUI callback to add log
RegisterNUICallback("addLog", function(data)
  TriggerServerEvent("wx_anticheat:addLog", data.src, data.event, data.status)
end)

-- NUI callback to clear logs
RegisterNUICallback("clearLogs", function(_, cb)
  TriggerServerEvent("wx_anticheat:clearLogs")
  cb(true)
end)

-- NUI callback to get config file content
RegisterNUICallback("getConfig", function(_, cb)
  local configContent = LoadResourceFile(GetCurrentResourceName(), "configs/anticheat_config.lua")
  cb(configContent)
end)

-- ESP toggles state
local espToggles = {
  boxes = false,
  names = false,
  skeletons = false,
  objects = false
}

-- NUI callback to fetch current toggles
RegisterNUICallback("fetchToggles", function(_, cb)
  cb(espToggles)
end)

-- Toggle ESP options and log changes
function ToggleESPOption(option, state, description)
  espToggles[option] = state
  if wx.Debug then
    print(string.format("OPTION: %s | TOGGLE: %s", description, tostring(state)))
  end
  if state then
    TriggerServerEvent("wx_anticheat:logAdminMenu", "Toggled " .. description)
  end
  if not state and option == "objects" then
    StopFreecam()
  end
end

-- Register font for drawing text
local fontId = nil
CreateThread(function()
  RegisterFontFile("BBN")
  fontId = RegisterFontId("BBN")
end)

-- Draw 3D text at world coordinates
function DrawText3Ds(x, y, z, text)
  SetTextScale(0.45, 0.45)
  SetTextFont(fontId)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextDropShadow()
  SetTextCentre(true)
  AddTextComponentString(text)
  SetDrawOrigin(x, y, z, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
end

-- Additional functions like drawing ESP boxes, skeletons, etc. would be here...

-- Main loop to draw ESP elements based on toggles
CreateThread(function()
  while true do
    Wait(5)
    if espToggles.boxes then
      -- DrawBoxes()
    end
    if espToggles.names then
      -- DrawNames()
    end
    if espToggles.skeletons then
      -- DrawSkeletons()
    end
  end
end)

-- NUI callback to get locale data
RegisterNUICallback("getLocale", function(_, cb)
  local localeData = LoadUiLocale()
  cb(json.encode(localeData))
end)