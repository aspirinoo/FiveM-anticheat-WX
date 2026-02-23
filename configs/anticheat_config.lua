wx = {} -- Global variable, please do not touch this line.

-- =================================================
--         WX AntiCheat Configuration File
--
-- Welcome to the main configuration file for the AntiCheat.
-- In this file, you will configure the whole functionality
-- of the AntiCheat. If this is your first time setting the
-- AntiCheat up, please make sure to go over every option
-- and optionally, carefully test each one to make sure there
-- are no false detections, that might be caused for example
-- by a 3rd party resource on your server. Most common example
-- is the GodMode detection being triggered by MultiCharacter
-- scripts.
--
-- We do not recommend leaving the configuration file on
-- the default settings, as every server needs it's own
-- configuration for the AntiCheat to work correctly.
--
-- If you need any help with the AntiCheat, please check out
-- the official documentation. Most likely your problem will
-- be explained there. If you still need help with the AntiCheat,
-- please join our support Discord server.
--
-- For more information, read the README file in the "READ ME FIRST !!!/" folder
-- 
-- We hope you enjoy our product!
--
-- =================================================

-- =============================
--  🛡️ MAIN ANTICHEAT SETTINGS
-- =============================

wx.Debug = true                                     -- ⚠️ Admins can be detected. Players are able to be detected more than once. More informational prints are shown. Do NOT use in production
wx.Locale = "en"                                    -- 🔢 Locale to use. Modify/Create locales in locales/ folder. Premade options - [en/cs]
wx.txAdminAuth = true                               -- 💫 Enable support for admin checking via txAdmin - Every admin configured in txAdmin will be whitelisted by the AntiCheat automatically
wx.screenshotModule = "screenshot-basic"            -- 📸 Change this if you renamed your sc-basic resource (Make sure it matches). Or keep disabled if you don't want to use screenshots
wx.autoSQL = false                                  -- 💉 Automatically inserts the SQL file for you if it's not in your database already
wx.punishType = 'LOG'                               -- 🔨 (LOG/KICK/BAN) | LOG (Will only send the log) | KICK (Will only kick the player and send the log) | BAN (Will ban the player and send the log)
wx.Prefix = 'WX AntiCheat'                          -- 🏷️ You can rename the anticheat, this prefix will be in chat messages or when being punished
wx.showReason = true                                -- 📖 Should banned players be able to see the reason for being banned?
wx.appealDiscord = 'https://discord.gg/yourdiscord' -- 🔵 Your Discord link (URL Format - https://*)
wx.OCR = true                                       -- 📷 On Screen Detection - Once in a while the script will take screenshot from every player and search it for any suspicious words (mod menus)
wx.OCRCheckInterval = 15000                         -- 📷 In ms, how often should the anticheat check player's screen? Lower values = Faster checks = Higher lag spikes. Recommended to keep at default value (15000)
wx.spoilerIP = true                                 -- 🖌️ Adds IP addresses into a spoiler tag so they're not exposed unless clicked.
wx.antiVPN = false                                  -- 🌐 Prevents players using a VPN / Proxy from connecting. Can detect mostly free VPNs - won't work for 100% of VPNs
wx.ignoreIpBanChecking = false                      -- 🌐 Set to true to skip checking IP addresses for occurences in the banlist

-- =============================
--    💓 HEARTBEAT SETTINGS
-- =============================

wx.HeartBeat = {                                    -- 💓 HeartBeat settings, leave as it is, unless something is not working!
    enabled = true,                                 -- 🔛 (RECOMMENDED TO TURN ON) Enable Heartbeat system, the anticheat will check if player is responding on the client, prevents stopping the anticheat
    maxTime = 30,                                   -- ⌚ If the server doesn't receive any response from the client in X secs, disconnect him. Do not set it under 10 seconds
}

-- =============================
--    🚀 ADMIN MENU SETTINGS
-- =============================

wx.AdminMenu = {
    enable = true,           -- 🔛 Enable NUI admin menu for your registered admins (/wx)
    backgroundBlur = true,   -- 🖼️ Blur background when the admin menu is opened
    espSelf = true,          -- 🧍 See yourself on ESP options
    espMaxDist = 350.0,      -- 📏 Maximum distance for ESP to draw
    screenshotTimeout = 3,   -- ⌚ In seconds, maximum time the anticheat can try to take player's screenshot until giving up
    rgb = { 255, 255, 255 }, -- 🎨 RGB values for color rendering
    permissionLevel = "all", -- 📖 [all/limited] - all = Every registered admin can open the panel | limited = Only set identifiers can open the panel (configure below)
    allowedIds = {           -- 📚 Identifiers that can open the admin panel (if permissionLevel is set to "limited` You can use any identifier type
        "discord:1234",
        "license:123abc"
    }
}

-- =============================
--    🔢 NEEDED IDENTIFIERS
-- =============================

wx.NeededIdentifiers = { -- Required identifiers for every player to join the server. Most cheaters are usually missing the fivem: and discord: identifiers.
    ["fivem"] = true,    -- 🐌 FiveM Identifier, every player that has connected CFX.re account will have this identifier
    ["license"] = true,  -- ⭐ Rockstar License identifier, every player has this identifier
    ["discord"] = false, -- 🔵 Discord Identifier, every player that has connected discord account will have this identifier
    ["steam"] = false,   -- 🎮 Steam Identifier, every player that has Steam running will have this identifier. Make sure you have a valid Steam API key in your server.cfg (https://forum.cfx.re/t/using-the-steam-api-key-manually-on-the-server/805987)
}

-- =============================
--     💳 CONNECTING CARD
-- =============================

wx.connectingCard = { -- If enabled, players will see "Connecting..." text while connecting. You can translate it in the locale file
    enabled = true,
    length = 3500     -- in ms, how long should the card be shown to connecting players
}

-- =============================
--       ↗️ EVENT LIMITER
-- =============================

wx.EventLimiter = {
    -- Event Name    Maximum amount of times the event can be triggered in short time
    ["test:event"] = 5
}

-- =============================
--    💫 CLIENT DETECTIONS
-- =============================

wx.antiNUIDevTools = true         -- Detects nui_devtools ingame
wx.antiClearTasks = true          -- Detects kicking other players from cars etc.
wx.antiGiveWeapons = false        -- Detects giving weapons
wx.antiRemoveWeapons = true       -- Detects removing weapons
wx.antiBlacklistPlate = true      -- Detects blacklisted vehicle plates (Blacklist is below)
wx.antiPlateChange = false        -- Detects if player changes his vehicle plate (Can cause problems with vehicle shops)
wx.antiFold = true                -- Detects fold player option (ex. in Skript.gg cheat)
wx.antiKill = true                -- Detects kill player option (ex. in Skript.gg cheat)
wx.antiObjectAttach = true        -- Deletes all objects that are attached to players
wx.antiFastRun = true             -- Detects fast run
wx.antiTeleport = false           -- Detects if player is far away from his last position (teleporting)
wx.antiOverlay = false            -- Detects Mouse UI overlays (like eulen)
wx.antiMagicBullet = false        -- Detects magic bullet cheats (Shooting through walls)
wx.antiBlacklistedWeapon = true   -- Detects if player has weapon on blacklist
wx.antiBlacklistedVehicles = true -- Detects if player is in blacklisted vehicle
wx.antiGodMode = true             -- Detects god mode
wx.antiNoClip = true              -- Detects players noclipping
wx.antiVehicleNoClip = true       -- Detects players noclipping in vehicles
wx.antiTaze = true                -- Prevents cheaters from tazing other players
wx.antiInfiniteRoll = true        -- Detects infinite combat roll
wx.antiRadar = false              -- Detects if player has radar without being in any vehicle
wx.antiAIs = true                 -- Anti citizen AIs like No Recoil, Give all weapons, Boost Damage etc.
wx.antiMenus = true               -- Anti LUA Menus - This is significantly faster than OCR, because it only detects the most basic menus
wx.antiSmallPed = true            -- Anti small/tiny ped
wx.antiInvisible = false          -- Anti Invisible Player
wx.antiDamageBoost = true         -- Detects Citizen AIs and mods for boosted damage
wx.antiDefenseBoost = true        -- Detects Citizen AIs and mods for boosted defense
wx.antiInfiniteStamina = true     -- Detects infinite stamina mods/cheats/ais
wx.antiSuperJump = true           -- Detects Super Jump cheat
wx.antiBlips = false              -- Detects player blips cheat (See other players on map) - Disable if you're using any police blips script
wx.antiSpectate = true            -- Detects if player tries to spectate other players
wx.blacklistedEvents = true       -- Toggle events that will ban the player upon execution
wx.antiExplosiveAmmo = true       -- Detects explosive ammo
wx.antiInfiniteAmmo = true        -- Anti infinite ammo in clip
wx.antiThermal = true             -- Anti Thermal Vision (Has bypass for players in helicopters)
wx.antiNightVision = true         -- Anti Night Vision
wx.antiSpoofedShot = true         -- Detects spoofed bullets (shots the player didn't fired)
wx.antiSpoofWeapon = true         -- Detects spoofed weapons
wx.antiBoostVehicle = true        -- Detects boosted vehicle speeds

wx.maximumArmor = 75              -- Maximum % of armor player can have (1% - 100%) - Set to -1 to disable

-- =============================
--    💻 SERVER DETECTIONS
-- =============================

wx.antiBlacklistedVehiclesSpawn = true -- Detects if player spawns blacklisted vehicle (make sure to test the log mode to prevent false bans! it counts enviromental vehicles that spawned around him (like blimp))
wx.antiParticles = true                -- Detection of blacklisted particles
wx.antiExplosion = true                -- Blacklisted explosions
wx.antiTrainCage = true                -- Detects "Train Cage" option in various cheats that trap a player
wx.antiLaunchPlayer = true             -- Deteects "Launch Player" option that launches player in the air
wx.cancelOtherExplosions = false       -- If an explosion type isn't on blacklist, it will get cancelled
wx.antiObjects = true                  -- Detects creation of blacklisted objects and props
wx.antiPeds = true                     -- Detects creation of blacklisted peds
wx.explosionLimit = true               -- If true, player can only create a set amount of explosions in a specified time below before getting detected
wx.antiRamPlayer = true                -- Detects popular cheat options that spawn vehicles going really fast towards players

wx.antiSpam = {                        -- Settings for the AntiSpam module
    vehicles = true,                   -- Enables detection of spamming vehicle spawning
    peds = true,                       -- Enables detection of spamming pedestrian spawning
    object = true,                     -- Enables detection of spamming object spawning
    explosions = true,                 -- Enables detection of spamming explosions
    interval = 10000,                  -- Interval in miliseconds to count total entities for
    checkNearbyPlayers = true,         -- The AntiSpam module will only count entities spawned near online players
    nearbyPlayerDistance = 50.0,       -- The distance around player that will be counted as near the player

    maxVehicles = 10,                  -- Maximum vehicles player can spawn in the set interval
    maxPeds = 10,                      -- Maximum pedestrians player can spawn in the set interval
    maxExplosions = 15,                -- Maximum explosions player can trigger in the set interval
    maxObjects = 5                     -- Maximum objects player can spawn in the set interval
}

wx.teleportDistance = 300              -- How far player needs to be from his last location in short time to be detected?
wx.maximumModifier = 1.15              -- FLOAT VALUE! (0.0) - Minimum allowed damage/defense modifier before getting detected
wx.blacklistedVehiclesDeleteOnly = true -- Should blacklisted vehicles be only deleted without banning the player in it?

wx.ExplosionModifiers = {               -- Toggle each explosion modifiers that will be detected and blocked
    invisible = true,                   -- Explosions that are invisible
    inaudible = true,                   -- Explosions that you cannot hear
    dmgBoost = true                     -- Explosions that have boosted damage
}

wx.whitelistedCoords = {               -- Player won't be detected at these coords for freecam, for example on character selection
    vector3(0, 0, 0)
}

-- =============================
--    📜 LOGGING SETTINGS
-- =============================

wx.connectPrints = true     -- Prints player connecting
wx.connectLogs = true       -- Logs players connecting
wx.disconnectLogs = true    -- Logs player disconnecting
wx.ExplosionLogs = true     -- Logs explosions
wx.SpoofingLogs = true      -- Enables logging of possible spoofing attempts.

-- =========================================================
--    📄 BLACKLISTS, WHITELISTS AND REST OF THE SETTINGS
-- =========================================================

-- List of words for OCR to scan for. If any of these words are found on player's screen, they will get detected.
-- OCR scans only native strings, like menus, pause menu or 3D/2D text, NUI elements (like chat) won't apply
wx.OCRWords = {
    "FlexSkazaMenu", "SidMenu", "Lynx8", "LynxEvo", "Maestro Menu", "redEngine",
    "HamMafia", "HamHaxia", "Dopameme", "redMENU", "Desudo", "explode",
    "gamesense", "Anticheat", "Tapatio", "Malossi", "RedStonia", "Chocohax",
    "skin changer", "torque multiple", "override player speed", "colision proof", "explosion proof", "copy outfit",
    "play single particle", "infinite ammo", "rip server", "remove ammo", "remove all weapons", "V1s_u4l",
    "injected", "Explode Players", "Ram Player", "fallout", "godmode", "god mode",
    "modmenu", "esx money", "give armor", "aimbot", "trigger", "triggerbot",
    "Rapid Fire", "rage bot", "ragebot", "rapidfire", "freecam", "execute",
    "noclip", "ckgangisontop", "lumia1", "ISMMENU", "TAJNEMENUMenu", "rootMenu",
    "Outcasts666", "WaveCheat", "NacroxMenu", "MarketMenu", "topMenu", "Flip Vehicle",
    "Rainbow Paintjob", "Combat Assiters", "Damage Multiplier", "Give All Weapons", "Teleport To Impact", "Explosive Impact",
    "Server Nuke Options", "No Ragdoll", "Super Powers", "invisible all vehicles", "Spam Message", "Destroy Map",
    "Delete Props", "Cobra Menu", "no-clip", "injected", "Money Options",
    "Nuke Options", "Aimbot", "TriggerBot", "RapidFire", "Force Player Blips", "Force Radar",
    "Force Gamertags", "Steal Outfit", "ESX Money Options", "press AV PAG", "TP to Waypoint", "Self Options",
    "Vehicle options", "Weapon Options", "spam Vehicles", "taze All", "explosive ammo", "super damage",
    "rapid fire", "Super Jump", "Infinite Roll", "Cage Player", "Give all", "No Criticals",
    "Move On Water", "Disable Ragdoll", "CutzuSD", "Vertisso", "fuck server", "lynx",
    "Teleport to Closest Vehicle", "CKGang", "CK Gang", "CKGang 2.0", "Toggle ESP",
    "NoClip", "No-Clip", "Semi-GodMode", "Repair Vehicle", "Fix Vehicle", "absolute",
    "Lumia", "Gamesense", "Fivesense", "SkidMenu", "Dopamine", "Explode",
    "Teleport Options", "infnite combat roll", "Hydro Menu", "Enter Menu Open Key", "Give Single Weapon", "Airstrike Player",
    "Taze Player", "Razer Menu", "Swagamine", "Visual Options", "d0pamine", "Infinite Stamina",
    "Blackout", "Delete Vehicles Within Radius", "Engine Power Boost", "Teleport Into Player's Vehicle", "menu keybind",
    "nospread", "transparent props", "bullet tracers", "Dumper", "LUA Executor", "Executor",
    "Lux Menu", "NEVERWHERE", "Event Blocker", "Spectate", "Wallhack", "triggers",
    "crosshair", "Alokas66", "Hacking System!", "Destroy Menu", "Server IP", "Teleport To"
}

-- [ Blacklisted Weapons ]
wx.Weapons = {
    --  TRANSLATION/LABEL    INGAME MODEL NAME
    ['Heavy Sniper'] = 'weapon_heavysniper',
    ['Sniper Rifle'] = "weapon_sniperrifle",
    ['Minigun'] = "weapon_minigun",
    ['Heavy Rifle'] = "weapon_heavyrifle",
    ['Heavy Sniper MK2'] = "weapon_heavysniper_mk2",
    ['Marksman Rifle'] = "weapon_marksmanrifle",
    ['Marksman Rifle MK2'] = "weapon_marksmanrifle_mk2",
    ['RPG'] = "weapon_rpg",
    ['Grenade Launcher'] = "weapon_granadelauncher",
    ['Navy Revolver'] = "weapon_navyrevolver",
    ['Double Action Revolver'] = "weapon_doubleaction",
    ['Flare Gun'] = "weapon_flaregun",
    ['Vintage Pistol'] = "weapon_vintagepistol",
    -- ['Taser'] = "weapon_stungun",
    ['Marksman Pistol'] = "weapon_marksmanpistol",
    ['Gadget Pistol'] = "weapon_gadgetpistol",
    -- ['Pistol MK2'] = "weapon_pistol_mk2",
    ['Bottle'] = "weapon_bottle",
    ['Stone Hatchet'] = "weapon_stone_hatchet",
    ['Flare'] = "weapon_flare",
    ['Snowball'] = "weapon_snowball",
    -- ['Gas Canister'] = "weapon_petrolcan",
    ['Parachute'] = "gadget_parachute",
    ['Hazard Canister'] = "weapon_hazardcan",
    ['Fertilizer Can'] = "weapon_fertilizercan",
    ['EMP Launcher'] = "weapon_emplauncher",
    ['Machine Gun'] = "weapon_mg",
    -- ['SNS Pistol'] = "weapon_snspistol",
    ['SNS Pistol MK2'] = "weapon_snspistol_mk2",
    -- ['Nightstick'] = "weapon_nightstick",
    ['Ray Pistol'] = "weapon_raypistol",
    ['Ray Carbine'] = "weapon_raycarbine",
    ['Combat MG'] = "weapon_combatmg",
    ['Combat MG MK2'] = "weapon_combatmg_mk2",
    ['SMG MK2'] = "weapon_smg_mk2",
    ['Revolver MK2'] = "weapon_revolver_mk2",
    ['RPG 2'] = "weapon_rpg_2",
    ['Smoke Launcher'] = "weapon_grenadelauncher_smoke",
    ['Firework Launcher'] = "weapon_firework",
    ['Railgun'] = "weapon_railgun",
    ['Homing Launcher'] = "weapon_hominglauncher",
    ['Compact Launcher'] = "weapon_compactlauncher",
    ['Ray Minigun'] = "weapon_rayminigun",
    ['Grenade'] = "weapon_grenade",
    ['BZ Gas'] = "weapon_bzgas",
    ['Molotov'] = "weapon_molotov",
    ['Sticky Bomb'] = "weapon_stickybomb",
    ['Pipe Bomb'] = "weapon_pipebomb",
    ['Proximity Mine'] = "weapon_proxmine"
}

wx.whitelistedWeapons = { -- Weapons that won't be detected by weapon-based detections like antiExplosiveAmmo, rapid fire, etc.
    [`weapon_bzgas`] = true
}

wx.detectedKeys = { -- Controls (keys) that will be registered with the antiCheatOverlay
    121,            -- INSERT
}

wx.Plates = { -- Blacklisted vehicle plates
    'nigger',
    'nigga',
    'faggot',
    'retard',
    'ownage',
    'owned',
    'ckgang',
    'skriptgg',
    'eulen',
    'fatality'
}

wx.TaskList = { -- Blacklisted tasks https://alloc8or.re/gta5/doc/enums/eTaskTypeIndex.txt
    100,
    101,
    151,
    221,
    222
}



-- [ Blacklisted Particles ]
wx.Particles = {
    [`scr_firework_xmas_burst_rgw`] = true,
    [`exp_grd_petrol_pump`] = true,
    [`scr_clown_bul`] = true,
    [`scr_mich4_firework_trailburst_spawn`] = true,
    [`blood_shark_attack`] = true,
    [`td_blood_shotgun`] = true,
    [`td_blood_throat`] = true,
    [`blood_melee_punch`] = true,
    [`blood_exit`] = true,
    [`blood_chopper`] = true,
    [`trail_splash_blood`] = true,
    [`td_blood_stab`] = true,
    [`blood_armour_heavy`] = true,
    [`blood_mist`] = true,
    [`blood_nose`] = true,
    [`blood_entry_head_sniper`] = true,
    [`scr_ba_bomb_destroy`] = true,
    [`scr_clown_appears`] = true
}


-- [ Blacklisted/Fake Triggers ]
wx.triggerList = {
    -- type = 'client' = TriggerEvent
    -- type = 'server' = TriggerServerEvent

    -- ["esx_ambulancejob:revive"] = { type = "client" },

    ["esx:spawnVehicle"] = { type = "client" },
    ["esx:setgroup"] = { type = "client" },

    ["esx_garbagejob:payout"] = { type = "server" },
    ["esx_pizzajob:payout"] = { type = "server" },
    ["esx_truckerjob:payout"] = { type = "server" },
    ["AdminMenu:giveCash"] = { type = "server" },
    ["bank:deposit"] = { type = "server" },
    ["bank:withdraw"] = { type = "server" },
    ["esx_carthief:pay"] = { type = "server" },
    ["esx_gopostaljob:pay"] = { type = "server" },
    ["esx-qalle-jail:jailPlayer"] = { type = "server" },
    ["NB:recruterplayer"] = { type = "server" },
    ["paramedic:revive"] = { type = "server" },
    ["esx_jobs:caution"] = { type = "server" },
}

-- [ Blacklisted Vehicles ]
wx.vehicleBlacklist = {
    ["oppressor"] = true,
    ["oppressor2"] = true,
    ["hydra"] = true,
    ["lazer"] = true,
    ["rhino"] = true,
    ["valkyrie"] = true,
    ["apc"] = true,
    ["barracks"] = true,
    ["minitank"] = true,
    ["barrage"] = true,
    ["chernobog"] = true,
    ["halftrack"] = true,
    ["khanjali"] = true,
    ["scarab"] = true,
    ["scarab2"] = true,
    ["scarab3"] = true,
    ["deluxo"] = true,
    ["thruster"] = true,
    ["trailersmall2"] = true,
    ["deathbike2"] = true,
    ["deathbike3"] = true,
    ["shotaro"] = true,
    ["dominator4"] = true,
    ["dominator5"] = true,
    ["dominator6"] = true,
    ["slamtruck"] = true,
    ["freight"] = true,
    ["monster"] = true,
    ["monster2"] = true,
    ["monster3"] = true,
    ["monster4"] = true,
    ["monster5"] = true,
}

-- [ Blacklisted Peds Models to spawn/use ]
wx.pedBlacklist = {
    ['a_c_dolphin'] = true,
    ['a_c_killerwhale'] = true,
    ['a_c_sharktiger'] = true,
    ['a_c_humpback'] = true,
    ['mp_m_niko_01'] = true,
    ['s_m_y_swat_01'] = true,
    ['u_m_y_pogo_01'] = true,
    ['player_one'] = true,
    ['player_two'] = true,
    ['u_m_m_jesus_01'] = true,
    ['u_m_y_babyd'] = true,
    ['u_m_y_zombie_01'] = true,
    ['u_m_y_pogo_0'] = true,
    ['s_m_y_clown_01'] = true,
    ['mp_f_cocaine_01'] = true,
    ['a_c_chimp'] = true,
    ['u_m_y_juggernaut_01'] = true
}


-- [ Blacklisted objects ]
wx.objectBlacklist = {
    "prop_doghouse_01",
    "prop_ld_ferris_wheel",
    "ap1_lod_slod4",
    "cs4_lod_01_slod3",
    "p_spinning_anus_s",
    "sr_prop_stunt_tube_crn_15d_05a",
    "as_prop_as_dwslope30",
    "prop_carjack",
    "p_amb_brolly_01",
    "stt_prop_stunt_track_uturn",
    "stt_prop_stunt_track_turnice",
    "stt_prop_stunt_track_hill",
    "prop_gold_cont_01",
    "p_cablecar_s",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "prop_fnclink_05crnr1",
    "xs_prop_hamburgher_wl",
    "xs_prop_plastic_bottle_wl",
    "prop_windmill_01",
    "p_spinning_anus_s",
    "stt_prop_ramp_adj_flip_m",
    "stt_prop_ramp_adj_flip_mb",
    "stt_prop_ramp_adj_flip_s",
    "stt_prop_ramp_adj_flip_sb",
    "stt_prop_ramp_adj_hloop",
    "stt_prop_ramp_adj_loop",
    "stt_prop_ramp_jump_l",
    "stt_prop_ramp_jump_m",
    "stt_prop_ramp_jump_s",
    "stt_prop_ramp_jump_xl",
    "stt_prop_ramp_jump_xs",
    "stt_prop_ramp_jump_xxl",
    "stt_prop_ramp_multi_loop_rb",
    "stt_prop_ramp_spiral_l",
    "stt_prop_ramp_spiral_l_l",
    "stt_prop_ramp_spiral_l_m",
    "stt_prop_ramp_spiral_l_s",
    "stt_prop_ramp_spiral_l_xxl",
    "stt_prop_ramp_spiral_m",
    "stt_prop_ramp_spiral_s",
    "stt_prop_ramp_spiral_xxl",
    "stt_prop_stunt_track_dwslope30",
    "stt_prop_stunt_track_start",
    "stt_prop_stunt_track_slope45",
    "stt_prop_stunt_track_slope30",
    "stt_prop_stunt_track_slope15",
    "stt_prop_stunt_track_short",
    "stt_prop_stunt_track_sh45_a",
    "stt_prop_stunt_track_sh45",
    "stt_prop_stunt_track_sh30",
    "stt_prop_stunt_track_sh15",
    "stt_prop_stunt_track_otake",
    "stt_prop_stunt_track_link",
    "stt_prop_stunt_track_jump",
    "stt_prop_stunt_track_hill2",
    "stt_prop_stunt_track_hill",
    "stt_prop_stunt_track_funnel",
    "stt_prop_stunt_track_funlng",
    "stt_prop_stunt_track_fork",
    "stt_prop_stunt_track_exshort",
    "stt_prop_stunt_track_dwuturn",
    "stt_prop_stunt_track_dwturn",
    "stt_prop_stunt_track_dwslope45",
    "stt_prop_stunt_track_dwslope30",
    "stt_prop_stunt_track_dwslope15",
    "stt_prop_stunt_track_dwshort",
    "stt_prop_stunt_track_dwsh15",
    "stt_prop_stunt_track_dwlink_02",
    "stt_prop_stunt_track_dwlink",
    "stt_prop_stunt_track_cutout",
    "stt_prop_stunt_track_bumps",
    "stt_prop_stunt_target_small",
    "stt_prop_stunt_target",
    "stt_prop_stunt_soccer_sball",
    "stt_prop_stunt_soccer_lball",
    "stt_prop_stunt_soccer_goal",
    "stt_prop_stunt_soccer_ball",
    "stt_prop_stunt_ramp",
    "stt_prop_stunt_landing_zone_01",
    "stt_prop_stunt_jump_sb",
    "stt_prop_stunt_jump_s",
    "stt_prop_stunt_jump_mb",
    "stt_prop_stunt_jump_m",
    "stt_prop_stunt_jump_loop",
    "stt_prop_stunt_jump_lb",
    "stt_prop_stunt_jump_l",
    "stt_prop_stunt_jump45",
    "stt_prop_stunt_jump30",
    "stt_prop_stunt_jump15",
    "stt_prop_stunt_track_start",
    "prop_container_01a",
    "prop_contnr_pile_01a",
    "ce_xr_ctr2",
    "stt_prop_ramp_jump_xxl",
    "hei_prop_carrier_jet",
    "prop_parking_hut_2",
    "csx_seabed_rock3_",
    "db_apart_03_",
    "db_apart_09_",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "xs_prop_hamburgher_wl",
    "sr_prop_spec_tube_xxs_01a",
    "prop_air_bigradar",
    "p_tram_crash_s",
    "prop_windmill_01",
    "prop_start_gate_01",
    "prop_trailer_01_new",
    "sr_prop_sr_track_block_01",
    "sr_prop_spec_tube_xxs_04a",
    "stt_prop_stunt_soccer_sball",
    "stt_prop_stunt_track_cutout",
    "stt_prop_stunt_target_small",
    "prop_cj_big_boat",
    "stt_prop_stunt_domino"
}

wx.whitelistedPeds = { -- Spawning these peds will have no effects on wx.antiPeds and other detections
    [`mp_m_freemode_01`] = true
}

wx.whitelistedObjects = { -- Whitelisted objects that won't be deleted by wx.antiObjectAttach, Anti Spam Objects and other detections. By default it contains all objects from scully_emotemenu.

    -- Prop Animations
[`prop_cs_hand_radio`] = true,
    [`prop_pencil_01`] = true,
    [`prop_suitcase_01c`] = true,
    [`prop_tool_fireaxe`] = true,
    [`prop_tool_pickaxe`] = true,
    [`p_michael_backpack_s`] = true,
    [`prop_bskball_01`] = true,
    [`prop_fish_slice_01`] = true,
    [`prop_beach_ring_01`] = true,
    [`v_ret_ml_beerdus`] = true,
    [`v_ret_ml_beeram`] = true,
    [`v_ret_ml_beerpride`] = true,
    [`v_ret_ml_beerbar`] = true,
    [`prop_amb_beer_bottle`] = true,
    [`prop_beggers_sign_03`] = true,
    [`prop_beggers_sign_01`] = true,
    [`prop_beggers_sign_02`] = true,
    [`prop_beggers_sign_04`] = true,
    [`prop_binoc_01`] = true,
    [`hei_heist_sh_bong_01`] = true,
    [`xm3_prop_xm3_bong_01a`] = true,
    [`prop_bongos_01`] = true,
    [`prop_novel_01`] = true,
    [`prop_boombox_01`] = true,
    [`prop_cs_sol_glasses`] = true,
    [`prop_snow_flower_02`] = true,
    [`hei_prop_heist_box`] = true,
    [`prop_ld_case_01`] = true,
    [`prop_tool_broom`] = true,
    [`prop_pap_camera_01`] = true,
    [`prop_v_cam_01`] = true,
    [`bzzz_pizzahut_cup_a`] = true,
    [`prop_food_bs_bag_01`] = true,
    [`prop_food_cb_bag_01`] = true,
    [`prop_food_bag1`] = true,
    [`bzzz_pizzahut_menu_a`] = true,
    [`prop_pizza_box_02`] = true,
    [`bzzz_pizzahut_box_a`] = true,
    [`bkr_prop_biker_case_shut`] = true,
    [`prop_cash_case_01`] = true,
    [`prop_cash_case_02`] = true,
    [`ch_prop_ch_security_case_01a`] = true,
    [`v_ret_ml_beerben1`] = true,
    [`v_ret_ml_beerbla1`] = true,
    [`v_ret_ml_beerjak1`] = true,
    [`v_ret_ml_beerlog1`] = true,
    [`v_ret_ml_beerpis1`] = true,
    [`prop_beer_box_01`] = true,
    [`prop_mp_cone_02`] = true,
    [`ba_prop_battle_champ_open`] = true,
    [`vw_prop_vw_tray_01a`] = true,
    [`prop_amb_ciggy_01`] = true,
    [`prop_cigar_02`] = true,
    [`prop_cigar_01`] = true,
    [`prop_sponge_01`] = true,
    [`p_amb_clipboard_01`] = true,
    [`prop_roadcone02b`] = true,
    [`prop_parking_wand_01`] = true,
    [`prop_cs_bowie_knife`] = true,
    [`prop_tool_shovel`] = true,
    [`w_am_digiscanner`] = true,
    [`bkr_prop_duffel_bag_01a`] = true,
    [`prop_fishing_rod_01`] = true,
    [`prop_champ_flute`] = true,
    [`prop_food_bs_tray_03`] = true,
    [`prop_food_bs_tray_02`] = true,
    [`prop_food_cb_tray_02`] = true,
    [`prop_food_tray_02`] = true,
    [`prop_food_tray_03`] = true,
    [`bzzz_prop_torch_fire001`] = true,
    [`w_am_jerrycan`] = true,
    [`prop_controller_01`] = true,
    [`prop_cs_street_binbag_01`] = true,
    [`prop_bin_08open`] = true,
    [`prop_cs_bin_01`] = true,
    [`prop_cs_bin_03`] = true,
    [`prop_bin_08a`] = true,
    [`prop_bin_07d`] = true,
    [`bzzz_prop_gift_purple`] = true,
    [`bzzz_prop_gift_orange`] = true,
    [`bzzz_prop_gift_jewel`] = true,
    [`bzzz_prop_gift_bonbonier`] = true,
    [`prop_golf_wood_01`] = true,
    [`prop_acc_guitar_01`] = true,
    [`prop_el_guitar_01`] = true,
    [`prop_el_guitar_02`] = true,
    [`prop_el_guitar_03`] = true,
    [`sf_prop_sf_guitar_case_01a`] = true,
    [`vw_prop_casino_art_guitar_01a`] = true,
    [`sf_prop_sf_el_guitar_02a`] = true,
    [`prop_gun_case_01`] = true,
    [`ind_prop_firework_01`] = true,
    [`prop_mr_raspberry_01`] = true,
    [`pprp_icefishing_box_02`] = true,
    [`pprp_icefishing_box_01`] = true,
    [`prop_franklin_dl`] = true,
    [`prop_fib_badge`] = true,
    [`p_ld_id_card_002`] = true,
    [`prop_michael_sec_id`] = true,
    [`prop_lspd_badge`] = true,
    [`bkr_prop_fakeid_singledriverl`] = true,
    [`bkr_prop_fakeid_openpassport`] = true,
    [`prop_cs_dildo_01`] = true,
    [`p_cs_joint_02`] = true,
    [`prop_skid_chair_02`] = true,
    [`prop_leaf_blower_01`] = true,
    [`prop_phone_ing`] = true,
    [`prop_anim_cash_pile_01`] = true,
    [`prop_tourist_map_01`] = true,
    [`xm_prop_x17_bag_med_01a`] = true,
    [`prop_megaphone_01`] = true,
    [`prop_cs_mop_s`] = true,
    [`prop_police_id_board`] = true,
    [`bzzz_murder_axe001`] = true,
    [`w_pi_heavypistol`] = true,
    [`bzzz_murder_machete001`] = true,
    [`prop_v_bmike_01`] = true,
    [`p_ing_microphonel_01`] = true,
    [`prop_cliff_paper`] = true,
    [`ng_proc_paper_news_quik`] = true,
    [`ng_proc_paper_news_rag`] = true,
    [`prop_notepad_01`] = true,
    [`prop_cs_walking_stick`] = true,
    [`prideflag1`] = true,
    [`prideflag2`] = true,
    [`prideflag3`] = true,
    [`prideflag4`] = true,
    [`prideflag5`] = true,
    [`prideflag6`] = true,
    [`prideflag7`] = true,
    [`prideflag8`] = true,
    [`prideflag9`] = true,

    -- Food Animations (Consumable)
    [`sf_prop_sf_apple_01b`] = true,
    [`h4_prop_h4_caviar_tin_01a`] = true,
    [`prop_cs_bowl_01`] = true,
    [`prop_beerdusche`] = true,
    [`prop_beer_logopen`] = true,
    [`prop_beer_amopen`] = true,
    [`prop_beer_pissh`] = true,
    [`prop_cs_beer_bot_02`] = true,
    [`prop_bottle_brandy`] = true,
    [`prop_food_bs_coffee`] = true,
    [`prop_food_bs_juice01`] = true,
    [`prop_food_bs_chips`] = true,
    [`scully_boba`] = true,
    [`scully_boba2`] = true,
    [`scully_boba3`] = true,
    [`prop_candy_pqs`] = true,
    [`bzzz_food_xmas_lollipop_a`] = true,
    [`bzzz_food_xmas_lollipop_b`] = true,
    [`bzzz_food_xmas_lollipop_c`] = true,
    [`bzzz_food_xmas_lollipop_d`] = true,
    [`bzzz_food_xmas_lollipop_e`] = true,
    [`prop_drink_champ`] = true,
    [`v_ret_ml_chips2`] = true,
    [`p_amb_coffeecup_01`] = true,
    [`bzzz_foodpack_croissant001`] = true,
    [`prop_plastic_cup_02`] = true,
    [`prop_amb_donut`] = true,
    [`prop_donut_02`] = true,
    [`bzzz_foodpack_donut002`] = true,
    [`bzzz_foodpack_donut001`] = true,
    [`prop_ld_flow_bottle`] = true,
    [`prop_cs_burger_01`] = true,
    [`prop_ecola_can`] = true,
    [`prop_choc_ego`] = true,
    [`bzzz_animal_fish002`] = true,
    [`bzzz_food_xmas_gingerbread_a`] = true,
    [`prop_cs_hotdog_01`] = true,
    [`prop_cs_hotdog_02`] = true,
    [`bzzz_icecream_cherry`] = true,
    [`bzzz_icecream_chocolate`] = true,
    [`bzzz_icecream_lemon`] = true,
    [`bzzz_icecream_pistachio`] = true,
    [`bzzz_icecream_raspberry`] = true,
    [`bzzz_icecream_stracciatella`] = true,
    [`bzzz_icecream_strawberry`] = true,
    [`bzzz_icecream_walnut`] = true,
    [`natty_lollipop_spiral01`] = true,
    [`natty_lollipop_spiral02`] = true,
    [`natty_lollipop_spiral03`] = true,
    [`natty_lollipop_spiral04`] = true,
    [`natty_lollipop_spiral05`] = true,
    [`natty_lollipop_spiral06`] = true,
    [`natty_lollipop_spin01`] = true,
    [`natty_lollipop_spin02`] = true,
    [`natty_lollipop_spin03`] = true,
    [`natty_lollipop_spin04`] = true,
    [`natty_lollipop_spin05`] = true,
    [`natty_lollipop01`] = true,
    [`bzzz_food_xmas_macaroon_a`] = true,
    [`bzzz_food_dessert_a`] = true,
    [`v_res_tt_milk`] = true,
    [`scully_pho`] = true,
    [`prop_pineapple`] = true,
    [`v_res_tt_pizzaplate`] = true,
    [`prop_wine_rose`] = true,
    [`prop_rum_bottle`] = true,
    [`prop_sandwich_01`] = true,
    [`v_res_tt_can03`] = true,
    [`prop_taco_01`] = true,
    [`prop_tequila_bottle`] = true,
    [`prop_food_bs_burger2`] = true,
    [`prop_vodka_bottle`] = true,
    [`prop_wheat_grass_glass`] = true,
    [`prop_wheat_grass_half`] = true,
    [`prop_cs_whiskey_bottle`] = true,
    [`prop_wine_white`] = true,
    [`bzzz_food_xmas_mug_a`] = true,
    [`bzzz_food_xmas_mug_b`] = true,
    [`bzzz_food_xmas_mulled_wine_a`] = true,
}

-- [ Explosion Blacklist ] (https://docs.wx0.dev/docs/gta-data/explosions)
wx.explosionList = {
    [0]  = "GRENADE",
    [1]  = "GRENADELAUNCHER",
    [2]  = "STICKYBOMB",
    [3]  = "MOLOTOV",
    [4]  = "ROCKET",
    [5]  = "TANKSHELL",
    [6]  = "HI_OCTANE",
    -- [7]  = "CAR",
    -- [8]  = "PLANE",
    -- [9]  = "PETROL_PUMP",
    -- [10] = "BIKE",
    -- [11] = "DIR_STEAM",
    -- [12] = "DIR_FLAME",
    -- [13] = "DIR_WATER_HYDRANT",
    -- [14] = "DIR_GAS_CANISTER",
    -- [15] = "BOAT",
    -- [16] = "SHIP_DESTROY",
    -- [17] = "TRUCK",
    -- [18] = "BULLET",
    [19] = "SMOKEGRENADELAUNCHER",
    [20] = "SMOKEGRENADE",
    [21] = "BZGAS",
    [22] = "FLARE",
    -- [23] = "GAS_CANISTER",
    -- [24] = "EXTINGUISHER",
    [25] = "PROGRAMMABLEAR",
    -- [26] = "TRAIN",
    -- [27] = "BARREL",
    -- [28] = "PROPANE",
    -- [29] = "BLIMP",
    -- [30] = "DIR_FLAME_EXPLODE",
    -- [31] = "TANKER",
    -- [32] = "PLANE_ROCKET",
    -- [33] = "VEHICLE_BULLET",
    -- [34] = "GAS_TANK",
    -- [35] = "BIRD_CRAP",
    [36] = "RAILGUN",
    -- [37] = "BLIMP2",
    [38] = "FIREWORK",
    -- [39] = "SNOWBALL",
    [40] = "PROXMINE",
    [41] = "VALKYRIE_CANNON",
    [42] = "AIR_DEFENSE",
    [43] = "PIPEBOMB",
    [44] = "VEHICLEMINE",
    [45] = "EXPLOSIVEAMMO",
    [46] = "APCSHELL",
    [47] = "BOMB_CLUSTER",
    [48] = "BOMB_GAS",
    [49] = "BOMB_INCENDIARY",
    [50] = "BOMB_STANDARD",
    [51] = "TORPEDO",
    [52] = "TORPEDO_UNDERWATER",
    [53] = "BOMBUSHKA_CANNON",
    [54] = "BOMB_CLUSTER_SECONDARY",
    [55] = "HUNTER_BARRAGE",
    [56] = "HUNTER_CANNON",
    [57] = "ROGUE_CANNON",
    [58] = "MINE_UNDERWATER",
    [59] = "ORBITAL_CANNON",
    [60] = "BOMB_STANDARD_WIDE",
    [61] = "EXPLOSIVEAMMO_SHOTGUN",
    [62] = "OPPRESSOR2_CANNON",
    [63] = "MORTAR_KINETIC",
    [64] = "VEHICLEMINE_KINETIC",
    [65] = "VEHICLEMINE_EMP",
    [66] = "VEHICLEMINE_SPIKE",
    [67] = "VEHICLEMINE_SLICK",
    [68] = "VEHICLEMINE_TAR",
    [69] = "SCRIPT_DRONE",
    [70] = "RAYGUN",
    [71] = "BURIEDMINE",
    [72] = "SCRIPT_MISSILE",
    [73] = "SCRIPT_MISSILE",
    [82] = "EXP_TAG_SUBMARINE_BIG"
}
