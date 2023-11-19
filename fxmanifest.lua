fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sk_robbery"
author "SkullCode"
version "1.0.1"
description "A simple Cash-Robbery Skript."

client_scripts {
  'main/client.lua',
}

server_scripts {
  'main/server.lua',
  'main/updater.lua'
  }

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'es_extended',
  'ox_lib'
}