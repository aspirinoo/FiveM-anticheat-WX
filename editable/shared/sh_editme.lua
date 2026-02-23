---Prettier print function
---@param text string
---@param type string
---@return nil
function BetterPrint(text, type)
  local types = {
    ["error"] = "^7[^1 ERROR ^7] ",
    ["warning"] = "^7[^3 WARNING ^7] ",
    ["config"] = "^7[^3 CONFIG WARNING ^7] ",
    ["info"] = "^7[^5 INFO ^7] ",
    ["success"] = "^7[^2 SUCCESS ^7] ",
    ["debug"] = "^7[^4 DEBUG ^7] ",
  }
  return print("^7[^5 WX ANTICHEAT ^7] " .. (types[type or "info"]) .. text)
end

exports("getConfig", function()
  return wx
end)

function LoadLocale()
  local language = wx.Locale
  local file = LoadResourceFile(GetCurrentResourceName(), ('locales/%s.json'):format(language))

  if not json.decode(file) then
    return BetterPrint(
      ("Couldn't load locale - [locales/%s.json] - Please check your config and locales/ folder!"):format(language),
      "warning")
  end
  return json.decode(file)
end

function LoadUiLocale()
  local language = wx.Locale
  local file = LoadResourceFile(GetCurrentResourceName(), ('locales/%s.ui.json'):format(language))

  if not json.decode(file) then
    return BetterPrint(
      ("Couldn't load UI locale - [locales/%s.ui.json] - Please check your config and locales/ folder!"):format(language),
      "warning")
  end
  return json.decode(file)
end

--[[

data:
  {
    playerId: number,
    reason: string,
    image: string,
    config: string,
    playerData = {
      name: string,
      hwid = {
        [1]: string,
        [2]: string,
        [3]: string,
        [4]: string,
        [5]: string,
      },
      identifiers = {
        steamId: string,
        ipAddress: string,
        discordId: string,
        license: string,
        fivemId: string,
      }
    }
  }
]]
function wx:onBan(data)
  if wx.Debug then
    -- Run on server side only
    if IsDuplicityVersion() then
      -- BetterPrint(("Player ^3%s^7 has been detected for ^3%s^7"):format(data.playerData.name, data.reason), "info")
    end
  end
end

function GetTableSize(t)
  local count = 0
  for _, _ in pairs(t) do
    count = count + 1
  end
  return count
end

function DebugPrint(message)
  if wx.Debug then
    BetterPrint(message, "debug")
  end
end
