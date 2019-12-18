wallpaper for awesome wm
========================

awesome wm plugin for wallpaper rotation and settings.

## Usage

### rotate wallpapers

#### method create

  first arg = rotateion interval ( milliseconds )

  second arg = directory path at wallpapers

##### example

  ``` lua
  require( "wallpaper" ):create( 3600 , os.getenv('HOME').."/images/wallpaper" )
  ```

#### method switch

  arg = offset index on wallpaper list

##### example

  ``` lua
  if wallpaper:exist_files() then
    capi.root.keys( gears.table.join( capi.root.keys() ,
      awful.key(( { ctrl , alt } , ',' , function() wallpaper:change( -1 ) end )
    ) )

    capi.root.keys( gears.table.join( capi.root.keys() ,
      awful.key(( { ctrl , alt } , '.' , function() wallpaper:change(  1 ) end )
    ) )
  end
  ```

### setting wallpaper

#### method set

  arg = wallpaper image path

##### example

  ``` lua
  require( "wallpaper" ):set( os.getenv('HOME').."/images/wallpaper/wallpaper.png" )
  ```
