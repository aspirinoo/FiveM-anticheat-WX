-- Check if wx config is loaded
if not wx then
  BetterPrint("Couldn't load your config! Please ensure that your config file exists and has no errors!", "error")
  return
end

-- Load playtime data
local playtimeDataRaw = LoadResourceFile(GetCurrentResourceName(), "data/playtime.json")
local playtimeData = json.decode(playtimeDataRaw) or {}

-- Initialize BanIds and BanCount
BanIds = {}
BanCount = 0

-- Table to store bullet check data per player
local bulletCheckData = {}

-- Register event to track bullet checks
RegisterNetEvent("wx_anticheat:checkBullet", function(coords)
  local src = source
  bulletCheckData[src] = {
    coords = coords,
    time = GetGameTimer()
  }
end)

-- Generate a random key of given length
function RandomKey(length)
  math.randomseed(os.time())
  local charset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local key = ""
  for i = 1, length do
    local randIndex = math.random(1, #charset)
    key = key .. charset:sub(randIndex, randIndex)
  end
  return key
end

-- Generate and store client key
GlobalState.clientKey = RandomKey(math.random(30, 50))
GlobalState.OCRWebhook = Webhooks.ScreenshotOCR

-- Cache bans from database on startup
CreateThread(function()
  MySQL.Async.fetchAll("SELECT * FROM `wx_anticheat`", {}, function(results)
    BanIds = {}
    BanCount = 0
    for _, ban in ipairs(results) do
      BanCount = BanCount + 1
      BanIds[ban.banID] = true
    end
    if wx.Debug then
      BetterPrint(string.format("Cached %d bans", BanCount), "debug")
    end
  end)
end)

-- Auto SQL import if enabled
if wx.autoSQL then
  BetterPrint("Attempting to import SQL for you...", "info")
  local createTableQuery = [[
    CREATE TABLE IF NOT EXISTS wx_anticheat (
      banID VARCHAR(9) NOT NULL,
      playerName VARCHAR(25) NOT NULL,
      steamid VARCHAR(40),
      ip VARCHAR(40),
      license VARCHAR(100),
      license2 VARCHAR(100),
      discordid VARCHAR(100),
      fivem VARCHAR(100),
      xbox VARCHAR(100),
      live VARCHAR(100),
      reason VARCHAR(255) NOT NULL,
      HWID VARCHAR(130) NOT NULL,
      HWID2 VARCHAR(130) NOT NULL,
      HWID3 VARCHAR(130) NOT NULL,
      HWID4 VARCHAR(130) NOT NULL,
      HWID5 VARCHAR(130) NOT NULL,
      PRIMARY KEY (banID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
  ]]
  MySQL.insert.await(createTableQuery, {})
  BetterPrint("SQL has been inserted, please disable wx.autoSQL in your config and restart the script", "success")
end

-- Error logging function
function Error(msg)
  BetterPrint("An error has occurred in the anticheat, please check your configs for any errors. Error Message: ^3" .. tostring(msg) .. "^7", "error")
end

-- Get size of a table
function GetTableSize(tbl)
  local count = 0
  for _ in pairs(tbl) do
    count = count + 1
  end
  return count
end

-- Check if player is admin based on allowed IDs
function wx.AdminStatus(playerId)
  if not playerId or type(playerId) ~= "string" or #playerId == 0 then
    return true
  end

  if L5_1[playerId] then -- L5_1 is assumed to be a table of admins
    return true
  end

  if Admins and GetTableSize(Admins) > 0 then
    for _, identifier in pairs(GetPlayerIdentifiers(playerId)) do
      for _, allowedId in pairs(wx.AdminMenu.allowedIds) do
        if identifier == allowedId then
          return true
        end
      end
    end
  end

  return false
end

-- Export isAdmin function
exports("isAdmin", wx.AdminStatus)

-- Get admin type for player
function getAdminType(playerId)
  if not wx.AdminStatus(playerId) then
    return false
  end
  if L5_1[playerId] then
    return "tx"
  else
    return "config"
  end
end

-- (Additional code continues...)