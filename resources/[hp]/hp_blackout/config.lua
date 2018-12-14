Config = {}

-- Amount of Time to Blackout, in milliseconds
-- 2000 = 2 seconds
Config.BlackoutTime = 9000

-- Enable blacking out due to vehicle damage
-- If a vehicle suffers an impact greater than the specified value, the player blacks out
Config.BlackoutFromDamage = true
Config.BlackoutDamageRequired = 50

-- Enable blacking out due to speed deceleration
-- If a vehicle slows down rapidly over this threshold, the player blacks out
Config.BlackoutFromSpeed = true
Config.BlackoutSpeedRequired = 40 -- Speed in MPH

-- Enable the disabling of controls if the player is blacked out
Config.DisableControlsOnBlackout = true
