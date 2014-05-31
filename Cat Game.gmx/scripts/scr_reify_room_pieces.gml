
// 9001
var tiles = tile_get_ids_at_depth(9001);
 for (var i = 0; i < array_length_1d(tiles); i++;)
 {
        var _obj = instance_create(tile_get_x(tiles[i]),tile_get_y(tiles[i]), obj_debug_floor);
        _foo = tile_get_width(tiles[i]);
        _bar = tile_get_height(tiles[i]);
        with (_obj) {
            // because this guy's sprite is 1x1
            image_xscale = other._foo;
            image_yscale = other._bar;
        }
 }
 

// 9002
/*

var tiles = tile_get_ids_at_depth(9002);
for (var i = 0; i < array_length_1d(tiles);i++;)
{
    var _obj = instance_create(tile_get_x(tiles[i]), tile_get_y(tiles[i]),obj_precise_floor);
    _foo_bg = tile_get_background(tiles[i]);
    _foo_left = tile_get_left(tiles[i]);
    _foo_top = tile_get_top(tiles[i]);
    _foo_width = tile_get_width(tiles[i]);
    _foo_height = tile_get_height(tiles[i]);
    with (_obj) { 
            sprite_index = scr_create_sprite_from_bg(other._foo_bg,other._foo_left,other._foo_top,other._foo_width,other._foo_height);
            mask_index = sprite_index;
    }
    tile_delete(tiles[i]);
}
*/ 
// this exploits the fact that the room creation is created before the actual
// objects in the room
// HACK really...
instance_create(4,20,obj_cat_adder);
instance_create(20,30,obj_player_failure_room_restart);
