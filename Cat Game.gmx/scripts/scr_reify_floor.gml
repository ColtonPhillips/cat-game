var tiles = tile_get_ids_at_depth(9001);
 for (var i = 0; i < array_length_1d(tiles); i++;)
 {
        var _obj = instance_create(tile_get_x(tiles[i]),tile_get_y(tiles[i]), obj_debug_floor);
        _foo = tile_get_width(tiles[i]);
        _bar = tile_get_height(tiles[i]);
        with (_obj) {
            image_xscale = other._foo;
            image_yscale = other._bar;
        }
 }
