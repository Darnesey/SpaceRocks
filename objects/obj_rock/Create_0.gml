/// @description Insert description here
// You can write your code in this editor
speed = random(5);
direction = point_direction(x, y, obj_player.x, obj_player.y);
image_angle = random(360);

if obj_game.flip_color
{
	image_blend = make_color_rgb(0, 0, 0);	
}