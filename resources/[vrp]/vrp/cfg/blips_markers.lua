
-- this file is used to define additional static blips and markers to the map
-- some lists: https://wiki.gtanet.work/index.php?title=Blips

local cfg = {}

-- list of blips
-- {x,y,z,idtype,idcolor,text}
cfg.blips = {
	{305.5517,-1436.4125,29.8041,61,3,"Hospital Centrum"},
	{236.4192,216.9608,106.2867,434,4,"Pengetransport"},
	{-1468.5388,-325.7583,44.8469,280,2,"Fiskekøber"},
	{235.4255,-411.5229,48.1119,188,3,"Retssal"},
	{-1385.5855,-600.1740,43.2439,93,8,"Bahama Mamas"},
	{130.7033,-1295.1390,29.2695,121,48,"Vanilla Unicorn"},
	{-555.8648,286.59375,82.1762,93,27,"Tequilala"},
	{-1159.5937,-1722.2495,4.9029,225,50,"Bill's Bilshop"},
	{-589.5085,-928.9516,6.2641,184,45,"Hyperion News"},
	{125.9466,-753.7242,242.1520,408,21,"Judica Advokat"},
	{-437.0605,271.2053,89.8887,102,7,"Comedy Club"},
	
	-- specielle huse
	{-812.8660,173.3490,76.7400,40,69,"Rockford Hills 3"}, -- Michael's Hus (Rockford Hills 3)
	{8.3423,539.4202,176.0282,40,69,"Whispymound Drive 3671"}, -- Franklin's Hus (Whispymound Drive 3671)
	{-106.9047,-8.4457,70.5240,40,33,"Las Lagunas Boulevard 924"}, -- Skummel lejlighed (Las Lagunas Boulevard 924)
	{1274.7567,-1720.9866,54.6807,40,33,"Armarillo Vista 4"}, -- Lesters hus (Armarillo Vista 4)
	{-1151.0563,-1520.2897,10.6327,40,33,"Magellan Avenue 7611"}, -- Floyds lejlighed (Magellan Avenue 7611)
	--{1972.9704,3818.0390,33.4361,40,33,"Zancudo Avenue 1"}, -- Trevors trailer (Zancudo Avenue 1)
	
	-- grupperinger
	{-14.2037,-1441.4624,31.1024,40,59,"The Family"}, -- Denice's hus (Forum Drive, Strawberry 4)
}

-- list of markers
-- {x,y,z,sx,sy,sz,r,g,b,a,visible_distance}
cfg.markers = {}

return cfg
