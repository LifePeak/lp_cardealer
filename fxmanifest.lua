fx_version 'cerulean'
game 'gta5'

name "lp_test"
description "New Script"
author "LifePeak"
version "1.0.0"

shared_script {
	'@es_extended/imports.lua', -- Remove this if you use ESX v1 and NOT ESX Legacy
	'@es_extended/locale.lua',
    'locales/*.lua',
	'config.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
