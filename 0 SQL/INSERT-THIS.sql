-- Default WX AntiCheat SQL import file
-- DO NOT EDIT ANY OF THESE VALUES

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

-- Run this query if you already have an older version of the SQL file
ALTER TABLE wx_anticheat ADD COLUMN fivem VARCHAR(100) DEFAULT "Not Found";
ALTER TABLE wx_anticheat ADD COLUMN xbox VARCHAR(100) DEFAULT "Not Found";
ALTER TABLE wx_anticheat ADD COLUMN live VARCHAR(100) DEFAULT "Not Found";
ALTER TABLE wx_anticheat ADD COLUMN license2 VARCHAR(100) DEFAULT "Not Found";
ALTER TABLE wx_anticheat DROP PRIMARY KEY;
ALTER TABLE wx_anticheat ADD PRIMARY KEY (banID);