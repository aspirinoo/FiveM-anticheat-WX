-- Check if HeartBeat is enabled in config
if not wx.HeartBeat.enabled then
  return
end

local heartbeatActive = false
local usedKeys = {}
local currentKey = nil

-- Seed random generator with game timer multiplied by 10
math.randomseed(GetGameTimer() * 10)

-- Check if a key is already used
function IsKeyUsed(key)
  for usedKey, _ in pairs(usedKeys) do
    if usedKey:find(key) then
      return true
    end
  end
  return false
end

-- Generate a random alphanumeric key of length A0_2
function RandomKey(length)
  local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local key = ""

  for _ = 1, length do
    local randIndex = math.random(1, #charset)
    key = key .. charset:sub(randIndex, randIndex)
  end

  if not IsKeyUsed(key) then
    usedKeys[key] = true
    return key
  else
    -- If key is used, generate a new key with random length between 30 and 35
    local newLength = math.random(30, 35)
    local newKey = RandomKey(newLength)
    usedKeys[newKey] = true
    return newKey
  end
end

-- Event to receive heartbeat key from server
RegisterNetEvent("wx_anticheat:heartbeat:sendKey")
AddEventHandler("wx_anticheat:heartbeat:sendKey", function(key)
  currentKey = key
end)

-- On player spawn, activate heartbeat
AddEventHandler("playerSpawned", function()
  if heartbeatActive then return end
  heartbeatActive = true
end)

-- Function to send heartbeat to server
local function SendHeartbeat()
  local keyLength = math.random(15, 35)
  local key = RandomKey(keyLength)

  -- Insert currentKey somewhere in the key at a random position
  local insertPos = math.random(0, #key)
  local modifiedKey = key:sub(1, insertPos) .. (currentKey or "") .. key:sub(insertPos + 1)

  -- Convert string to byte array
  local byteArray = {}
  for i = 1, #modifiedKey do
    byteArray[i] = string.byte(modifiedKey, i)
  end

  -- Send heartbeat to server
  TriggerServerEvent("wx_anticheat:heartbeat:send", byteArray, insertPos)

  -- Mark this key as used
  usedKeys[modifiedKey] = true
end

-- Thread to request initial key and send heartbeat periodically
CreateThread(function()
  TriggerServerEvent("wx_anticheat:heartbeat:requestKey")

  while true do
    Wait(10000) -- 10 seconds
    SendHeartbeat()
  end
end)

-- Event to force sending heartbeat immediately
RegisterNetEvent("wx_anticheat:heartbeat:force")
AddEventHandler("wx_anticheat:heartbeat:force", function()
  SendHeartbeat()
end)

-- Thread to clear used keys every 30 minutes
CreateThread(function()
  while true do
    Wait(1800000) -- 30 minutes
    usedKeys = {}
  end
end)