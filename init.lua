local gears = require("gears")
local wallpaper = {}
local index = 1
local files = {}
local path = nil
local timer = nil
local beautiful = require( "beautiful" )
local capi = { screen = screen }

function wallpaper:exist_files()
  if #files > 0 then
    return true
  else
    return false
  end
end

-- wallpaper
function wallpaper:create( interval , wallpaperpath )
  path = wallpaperpath
  local file = io.popen("ls -1 " ..path .. "| grep \".jpg\\|.png\\|.JPG\\|/PNG\"")
  local handle = file:read("*l")
  timer = gears.timer { timeout = interval }
  while handle ~= nil do
    table.insert(files, handle)
    handle = file:read("*l")
  end

  math.randomseed( os.time( ) )
  for i = 1 , #files do
    local j = math.random( 1 , #files )
    files[ j ] , files[ i ] = files[ i ] , files[ j ]
  end

 timer:connect_signal("timeout", function() wallpaper:change( 1 ) end)
 timer:start()
 wallpaper:change( 0 )
end

function wallpaper:change( num )
  timer:stop()
  index = index + num
  if index > #files then
    index = 1
  elseif index < 1 then
    index = #files
  end

  for s = 1, screen.count() do
    gears.wallpaper.maximized( path .. '/' .. files[ index ], s, true )
  end
  timer:start()
end

function wallpaper:set( image )
  for s = 1, capi.screen.count() do
    if image then
      gears.wallpaper.maximized( image, s, true )
    else
      gears.wallpaper.maximized( beautiful.wallpaper, s, true )
    end
  end
end

return wallpaper
