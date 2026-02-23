--[[
    WX AntiCheat - Webhook Configuration
    Do NOT rename or remove the `Webhooks` table.
    Documentation: Each webhook can be customized or left empty.
]]

Webhooks = {}

-- ══════════════════════════════════════════════
-- ✅ REQUIRED WEBHOOKS
-- ══════════════════════════════════════════════

-- Main webhook for all detections (REQUIRED)
Webhooks.Main =
''


-- ══════════════════════════════════════════════
-- 🧩 OPTIONAL WEBHOOKS FOR LOGGING
-- ══════════════════════════════════════════════

Webhooks.ConnectLog    = ''            -- Logs when players connect
Webhooks.ScreenshotOCR = Webhooks.Main -- Stores screenshots for OCR checking
Webhooks.ExplosionLog  = Webhooks.Main -- Explosion detection logs
Webhooks.AdminMenuLogs  = ''            -- Admin actions: bans, menu usage, etc.
Webhooks.UnbanLog      = ''            -- Player unban logs
Webhooks.VPNDetection  = Webhooks.Main -- VPN detection logs
Webhooks.AntiSpoofLog  = ''            -- Anti-spoofing logs


-- ══════════════════════════════════════════════
-- 🎨 EMBED SETTINGS (Affects all webhook messages)
-- ══════════════════════════════════════════════

Webhooks.Username  =
'WX AntiCheat'                                                                                      -- Shown as bot name in Discord
Webhooks.AvatarURL = 'https://tpr8otlvvv.ufs.sh/f/VNTtlh7BDT0xBTP0xosCXZyvGqAHknPwYI9DFSd7mWOe8Vxa' -- Avatar image
Webhooks.Color     = 15299028                                                                       -- Decimal color for embed border (use https://spycolor.com)
Webhooks.Inline    = true                                                                           -- true: fields in one line, false: each field on new line
