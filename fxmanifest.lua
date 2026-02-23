-- moose was here

fx_version 'cerulean'
game 'gta5'
description 'Advanced, standalone AntiCheat for your FiveM server'
author 'wx / woox'
version '3.99'
lua54 'yes'


-- [[ Scripts to load ]]

client_scripts {
	'client/**.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'configs/anticheat_webhooks.lua',
	'configs/admins/*.lua',
	'editable/server/*.lua',
	'server/**.lua',
}

shared_scripts {
	'configs/anticheat_config.lua',
	'editable/shared/*.lua',
}

-- [[ Escrow Stuff ]]

escrow_ignore {
	'configs/**.lua',
	'editable/**/*.lua',
	'config.lua'
}

-- [[ NUI Stuff ]]

ui_page "web/dist/index.html"
files {
	'data/*.json',
	"web/dist/index.html",
	"web/dist/**/*",
	'locales/*.json',
	'locales/*.ui.json',
}

-- [[ Exports ]]

server_exports {
	'ban',          -- exports['wx_anticheat']:ban(playerId, reason)
	'addAdmin',     -- exports['wx_anticheat']:addAdmin(playerId)
	'removeAdmin',  -- exports['wx_anticheat']:removeAdmin(playerId)
	'whitelistPlayer', -- exports['wx_anticheat']:whitelistPlayer(playerId, time) -1 as time for infinite time
	'removeWhitelist', -- exports['wx_anticheat']:removeWhitelist(playerId)
	'isAdmin',      -- exports['wx_anticheat']:isAdmin(playerId)
	'unban',        -- exports['wx_anticheat']:unban(banId)
	'offlineBan',   -- exports['wx_anticheat']:offline(playerId)
	'getConfig',    -- exports['wx_anticheat']:getConfig()
}

-- [[ Dependencies ]]

dependencies {
	'/server:4890',
	'/onesync',
}

dependency '/assetpacks'