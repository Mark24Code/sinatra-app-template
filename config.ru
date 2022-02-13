require './config/boot'
## load setting、logger、database
Boot.prepare

Boot.mount_app('main_app')

run App
