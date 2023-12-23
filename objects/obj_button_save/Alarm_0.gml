/// @description Insert description here
// You can write your code in this editor

var save_rocks = array_create(0);

with(obj_rock)
{
	var save_entity = {
		obj : object_get_name(object_index),
		y: y,
		x: x,
		dir : direction,
		angle : image_angle,
		spd : speed,
		image : sprite_index,
		hp : rock_health,
	}
	
	array_push(save_rocks, save_entity);
}

var player_data = undefined; 

with(obj_player)
{
	player_data = {
		obj : object_get_name(object_index),
		y: y,
		x: x,
		dir : direction,
		angle : image_angle,
	}
}

var save_data = {
	player : player_data,
	rocks : save_rocks,
	score : obj_game.points,
}

var _string = json_stringify(save_data);
var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "game.save");
buffer_delete(_buffer);

show_debug_message("Game Saved! Data: " + _string);

// After saving, go to main menu
room_goto(rm_menu);