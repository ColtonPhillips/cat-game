var xx,yy,w,h,bg,surf,spr;
bg=argument0;
xx=argument1;
yy=argument2;
w=argument3;
h=argument4;;

surf=surface_create(w,h);
surface_set_target(surf);
draw_set_blend_mode_ext(bm_one,bm_zero);
draw_background_part(bg, xx, yy, w, h, 0, 0);
draw_set_blend_mode(bm_normal);
surface_reset_target();

spr=sprite_create_from_surface(surf, 0, 0, w, h,false,false,0,0);

surface_free(surf);

return spr;
