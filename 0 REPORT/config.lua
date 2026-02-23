wx = {}

-- Basic settings
wx.Debug = true
wx.Locale = "cs"
wx.txAdminAuth = true
wx.screenshotModule = "screenshot-basic"
wx.autoSQL = false
wx.punishType = "LOG"

-- HeartBeat settings
wx.HeartBeat = {
  enabled = false,
  maxTime = 30
}

-- AdminMenu settings
wx.AdminMenu = {
  enable = true,
  backgroundBlur = true,
  espSelf = true,
  espMaxDist = 350.0,
  screenshotTimeout = 3,
  rgb = {255, 255, 255},
  permissionLevel = "all",
  allowedIds = {
    "discord:1234",
    "license:123abc"
  }
}

-- Needed Identifiers
wx.NeededIdentifiers = {
  fivem = true,
  license = true,
  discord = false,
  steam = false
}

-- Other settings
wx.Prefix = "WX AntiCheat"
wx.showReason = true
wx.appealDiscord = "https://discord.gg/yourdiscord"
wx.OCR = true
wx.OCRCheckInterval = 15000
wx.spoilerIP = true
wx.antiVPN = true

wx.connectingCard = {
  enabled = true,
  length = 3500
}

wx.EventLimiter = {
  ["test:event"] = 5
}

wx.antiNUIDevTools = true
wx.antiClearTasks = true
wx.antiGiveWeapons = false
wx.antiRemoveWeapons = true
wx.messageBlacklist = false
wx.antiBlacklistPlate = true
wx.antiPlateChange = false
wx.antiFold = true
wx.antiKill = true
wx.antiObjectAttach = true
wx.antiFastRun = true
wx.antiTeleport = false
wx.antiOverlay = false
wx.antiMagicBullet = false
wx.antiBlacklistedWeapon = true
wx.antiBlacklistedVehicles = true
wx.antiGodMode = true
wx.antiNoClip = true
wx.antiVehicleNoClip = true
wx.antiStatebagCrash = true
wx.antiTaze = true
wx.antiInfiniteRoll = true
wx.antiRadar = false
wx.antiAIs = true
wx.antiMenus = true
wx.antiSmallPed = true
wx.antiInvisible = false
wx.antiSilentAim = true
wx.antiVDM = false
wx.antiDamageBoost = true
wx.antiDefenseBoost = true
wx.antiInfiniteStamina = true
wx.antiSuperJump = true
wx.antiBlips = false
wx.antiSpectate = true
wx.fakeTriggers = true
wx.antiExplosiveAmmo = true
wx.antiInfiniteAmmo = true
wx.antiThermal = true
wx.antiNightVision = true
wx.antiSpoofedShot = true
wx.antiAimbot = true
wx.antiSpoofWeapon = true
wx.antiBlacklistedVehiclesSpawn = true
wx.antiSpamPed = true
wx.antiSpamVehicle = true
wx.antiSpamObject = true
wx.antiParticles = true
wx.antiExplosion = true
wx.cancelOtherExplosions = false

wx.ExplosionModifiers = {
  invisible = true,
  inaudible = true,
  dmgBoost = true
}

wx.antiObjects = true
wx.antiPeds = true
wx.explosionLimit = true
wx.maxExplosionsInterval = 10000
wx.maxExplosions = 15
wx.maxVehicle = 8
wx.maxObject = 5
wx.maxPed = 5
wx.freecamDistance = 45
wx.maxCreatingSpeed = 80
wx.teleportDistance = 300
wx.maximumModifier = 1.15

-- Whitelisted coordinates (vector3 values)
wx.whitelistedCoords = {
  vector3(0, 0, 0),
  -- Add other vector3 coordinates here as needed
}

wx.connectPrints = true
wx.connectLogs = true
wx.disconnectLogs = true
wx.ExplosionLogs = true

-- OCR words to detect
wx.OCRWords = {
  "FlexSkazaMenu", "SidMenu", "Lynx8", "LynxEvo", "Maestro Menu", "redEngine", "HamMafia", "HamHaxia",
  "Dopameme", "redMENU", "Desudo", "explode", "gamesense", "Anticheat", "Tapatio", "Malossi",
  "RedStonia", "Chocohax", "skin changer", "torque multiple", "override player speed", "colision proof",
  "explosion proof", "copy outfit", "play single particle", "infinite ammo", "rip server", "remove ammo",
  "remove all weapons", "V1s_u4l", "injected", "Explode Players", "Ram Player", "fallout", "godmode",
  "god mode", "modmenu", "esx money", "give armor", "aimbot", "trigger", "triggerbot", "Rapid Fire",
  "rage bot", "ragebot", "rapidfire", "freecam", "execute", "noclip", "ckgangisontop", "lumia1",
  "ISMMENU", "TAJNEMENUMenu", "rootMenu", "Outcasts666", "WaveCheat", "NacroxMenu", "MarketMenu",
  "topMenu", "Flip Vehicle", "Rainbow Paintjob", "Combat Assiters", "Damage Multiplier", "Give All Weapons",
  "Teleport To Impact", "Explosive Impact", "Server Nuke Options", "No Ragdoll", "Super Powers",
  "invisible all vehicles", "Spam Message", "Destroy Map", "Delete Props", "Cobra Menu", "no-clip",
  "injected", "Money Options", "Nuke Options", "Aimbot", "TriggerBot", "RapidFire", "Force Player Blips",
  "Force Radar", "Force Gamertags", "Steal Outfit", "ESX Money Options", "press AV PAG", "TP to Waypoint",
  "Self Options", "Vehicle options", "Weapon Options", "spam Vehicles", "taze All", "explosive ammo",
  "super damage", "rapid fire", "Super Jump", "Infinite Roll", "Cage Player", "Give all", "No Criticals",
  "Move On Water", "Disable Ragdoll", "CutzuSD", "Vertisso", "fuck server", "lynx", "Teleport to Closest Vehicle",
  "CKGang", "CK Gang", "CKGang 2.0", "Toggle ESP", "NoClip", "No-Clip", "Semi-GodMode", "Repair Vehicle",
  "Fix Vehicle", "absolute", "Lumia", "Gamesense", "Fivesense", "SkidMenu", "Dopamine", "Explode",
  "Teleport Options", "infnite combat roll", "Hydro Menu", "Enter Menu Open Key", "Give Single Weapon",
  "Airstrike Player", "Taze Player", "Razer Menu", "Swagamine", "Visual Options", "d0pamine",
  "Infinite Stamina", "Blackout", "Delete Vehicles Within Radius", "Engine Power Boost",
  "Teleport Into Player's Vehicle", "menu keybind", "nospread", "transparent props", "bullet tracers",
  "Dumper", "LUA Executor", "Executor", "Lux Menu", "NEVERWHERE", "Event Blocker", "Spectate", "Wallhack",
  "triggers", "crosshair", "Alokas66", "Hacking System!", "Destroy Menu", "Server IP", "Teleport To"
}

-- Whitelisted weapons (mapping weapon names to internal identifiers)
wx.Weapons = {
  ["Heavy Sniper"] = "weapon_heavysniper",
  ["Sniper Rifle"] = "weapon_sniperrifle",
  ["Minigun"] = "weapon_minigun",
  ["Heavy Rifle"] = "weapon_heavyrifle",
  ["Heavy Sniper MK2"] = "weapon_heavysniper_mk2",
  ["Marksman Rifle"] = "weapon_marksmanrifle",
  ["Marksman Rifle MK2"] = "weapon_marksmanrifle_mk2",
  ["RPG"] = "weapon_rpg",
  ["Grenade Launcher"] = "weapon_grenadelauncher",
  ["Navy Revolver"] = "weapon_navyrevolver",
  ["Double Action Revolver"] = "weapon_doubleaction",
  ["Flare Gun"] = "weapon_flaregun",
  ["Vintage Pistol"] = "weapon_vintagepistol",
  ["Marksman Pistol"] = "weapon_marksmanpistol",
  ["Gadget Pistol"] = "weapon_gadgetpistol",
  ["Bottle"] = "weapon_bottle",
  ["Stone Hatchet"] = "weapon_stone_hatchet",
  ["Flare"] = "weapon_flare",
  ["Snowball"] = "weapon_snowball",
  ["Parachute"] = "gadget_parachute",
  ["Hazard Canister"] = "weapon_hazardcan",
  ["Fertilizer Can"] = "weapon_fertilizercan",
  ["EMP Launcher"] = "weapon_emplauncher",
  ["Machine Gun"] = "weapon_mg",
  ["SNS Pistol MK2"] = "weapon_snspistol_mk2",
  ["Ray Pistol"] = "weapon_raypistol",
  ["Ray Carbine"] = "weapon_raycarbine",
  ["Combat MG"] = "weapon_combatmg",
  ["Combat MG MK2"] = "weapon_combatmg_mk2",
  ["SMG MK2"] = "weapon_smg_mk2",
  ["Revolver MK2"] = "weapon_revolver_mk2",
  ["RPG 2"] = "weapon_rpg_2",
  ["Smoke Launcher"] = "weapon_grenadelauncher_smoke",
  ["Firework Launcher"] = "weapon_firework",
  ["Railgun"] = "weapon_railgun",
  ["Homing Launcher"] = "weapon_hominglauncher",
  ["Compact Launcher"] = "weapon_compactlauncher",
  ["Ray Minigun"] = "weapon_rayminigun",
  ["Grenade"] = "weapon_grenade",
  ["BZ Gas"] = "weapon_bzgas",
  ["Molotov"] = "weapon_molotov",
  ["Sticky Bomb"] = "weapon_stickybomb",
  ["Pipe Bomb"] = "weapon_pipebomb",
  ["Proximity Mine"] = "weapon_proxmine"
}

-- Whitelisted weapon hashes (example)
wx.whitelistedWeapons = {
  [-1600701090] = true -- Example weapon hash
}

-- Detected keys (example)
wx.detectedKeys = {121} -- Example key code

-- Blacklisted plates (example)
wx.Plates = {
  "nigger", "nigga", "faggot", "retard", "ownage", "owned", "ckgang", "skriptgg", "eulen", "fatality"
}

-- Task list (example task IDs)
wx.TaskList = {100, 101, 151, 221, 222}

-- Particle blacklist (example particle hashes)
wx.Particles = {
  [738352871] = true,
  [141972143] = true,
  [-1036262254] = true,
  -- Add more particle hashes as needed
}

-- Trigger list with type (client/server)
wx.triggerList = {
  ["esx:spawnVehicle"] = {type = "client"},
  ["esx:setgroup"] = {type = "client"},
  ["esx_garbagejob:payout"] = {type = "server"},
  ["esx_pizzajob:payout"] = {type = "server"},
  ["esx_truckerjob:payout"] = {type = "server"},
  ["AdminMenu:giveCash"] = {type = "server"},
  ["bank:deposit"] = {type = "server"},
  ["bank:withdraw"] = {type = "server"},
  ["esx_carthief:pay"] = {type = "server"},
  ["esx_gopostaljob:pay"] = {type = "server"},
  ["esx-qalle-jail:jailPlayer"] = {type = "server"},
  ["NB:recruterplayer"] = {type = "server"},
  ["paramedic:revive"] = {type = "server"},
  ["esx_jobs:caution"] = {type = "server"}
}

-- Blocked words (example)
wx.blockedWords = {
  "negre", "negr", "nigga", "nigger", "niggers", "nate higgers", "retard", "faggots", "faggot", "kys"
}

-- Vehicle blacklist (example)
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
  ["slamtruck"] = true
}

-- Ped blacklist (example)
wx.pedBlacklist = {
  ["a_c_dolphin"] = true,
  ["a_c_killerwhale"] = true,
  ["a_c_sharktiger"] = true,
  ["a_c_humpback"] = true,
  ["mp_m_niko_01"] = true,
  ["s_m_y_swat_01"] = true,
  ["u_m_y_pogo_01"] = true,
  ["player_one"] = true,
  ["player_two"] = true,
  ["u_m_m_jesus_01"] = true,
  ["u_m_y_babyd"] = true,
  ["u_m_y_zombie_01"] = true,
  ["u_m_y_pogo_0"] = true,
  ["s_m_y_clown_01"] = true,
  ["mp_f_cocaine_01"] = true,
  ["a_c_chimp"] = true,
  ["u_m_y_juggernaut_01"] = true
}

-- Object blacklist (example)
wx.objectBlacklist = {
  "prop_doghouse_01", "prop_ld_ferris_wheel", "ap1_lod_slod4", "cs4_lod_01_slod3", "p_spinning_anus_s",
  "sr_prop_stunt_tube_crn_15d_05a", "as_prop_as_dwslope30", "prop_carjack", "p_amb_brolly_01",
  "stt_prop_stunt_track_uturn", "stt_prop_stunt_track_turnice", "stt_prop_stunt_track_hill",
  "prop_gold_cont_01", "p_cablecar_s", "stt_prop_stunt_tube_l", "stt_prop_stunt_track_dwuturn",
  -- Add more object names as needed
}

-- Explosion list (example)
wx.explosionList = {
  [0] = "GRENADE",
  [1] = "GRENADELAUNCHER",
  [2] = "STICKYBOMB",
  [3] = "MOLOTOV",
  [4] = "ROCKET",
  [5] = "TANKSHELL",
  [6] = "HI_OCTANE",
  [19] = "SMOKEGRENADELAUNCHER",
  [20] = "SMOKEGRENADE",
  [21] = "BZGAS",
  [22] = "FLARE",
  [25] = "PROGRAMMABLEAR",
  [36] = "RAILGUN",
  [38] = "FIREWORK",
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