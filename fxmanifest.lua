fx_version 'cerulean'
game 'gta5'

author 'pf_scripts'
description 'Simple Svelte setup designed for being compatible with the CfxLua runtime.'
repository 'https://github.com/PFScripts/fivem_lua_svelte_boilerplate'
version '1.0.0'

lua54 'yes'
use_experimental_fxv2_oal 'yes'
ui_page 'web/build/index.html'
ox_lib 'locale'

shared_script '@ox_lib/init.lua'

client_scripts {'client/*.lua', 'client/modules/*.lua'}

files {'web/build/index.html', 'web/build/**/*', 'locales/*.json'}

dependencies {'ox_lib'}