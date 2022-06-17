

var len = 500;
draw_set_alpha(.25);
for(var i = 0; i < 4; i++){
	draw_set_color(c_yellow);
	draw_line_width(x, y,  x +  lengthdir_x(len,(22 + 45 + image_angle + 90* i)), y + lengthdir_y(len, (22 + 45 + image_angle + 90 * i)), 30);
}
for(var i = 0; i < 4; i++){
	draw_set_color(c_orange);
	draw_line_width(x, y,  x +  lengthdir_x(len,(22 + image_angle + 90* i)), y + lengthdir_y(len, (22 + image_angle + 90 * i)), 10);
}
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale, image_angle, c_white, 1);