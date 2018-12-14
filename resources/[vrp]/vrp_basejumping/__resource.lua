resource_manifest '44febabe-d386-4d18-afbe-5e627f4af93'

dependency "vrp"
description "vrp_basejumping"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
