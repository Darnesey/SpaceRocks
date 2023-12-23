/// @description Insert description here
// You can write your code in this editor

points = 0;
next_level = false;
paused = false;
paused_surf = -1;

// New Game
if !obj_settings.load_saved_game
{
	show_debug_message("New Game!");
	var flip = 1;
	rock_count = obj_settings.rock_count; // processes faster
	var height_diff = room_height / 2;
	var spread = room_height / 10;
	for (var i = 0; i < rock_count; ++i) {
	
		instance_create_layer(room_width + 100, (room_height / 2) + (height_diff * flip), "Instances", obj_rock);
		flip *= -1;
		height_diff = (height_diff - spread) % (room_height / 2);
	}
	
}
else
{
	// Load existing game
	with (obj_player) instance_destroy();
	var _buffer = buffer_load("game.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var load_data = json_parse(_string);
	var _player = load_data.player;
	var _rocks = load_data.rocks;
	obj_game.points = load_data.score;
	with (instance_create_layer(0, 0, layer, asset_get_index(_player.obj)))
	{
		x = _player.x;
		y = _player.y;
		image_angle = _player.angle;
		direction = _player.dir;
	}
	
	while (array_length(_rocks) > 0)
	{
		var _rock = array_pop(_rocks);
		with (instance_create_layer(0, 0, layer, asset_get_index(_rock.obj)))
		{
			x = _rock.x;
			y = _rock.y;
			image_angle = _rock.angle;
			direction = _rock.dir;
			speed = _rock.spd;
			sprite_index = _rock.image;
			rock_health = _rock.hp;
		}
	}

	// Reset flag to not load the saved game again on death
	obj_settings.load_saved_game = false;
	show_debug_message("Game loaded! " + _string);
}
