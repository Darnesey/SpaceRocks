/// @description Insert description here
// You can write your code in this editor

instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_white);

direction = random(360);
rock_health -= 25

if sprite_index == spr_rock_big
{
	if rock_health <= 50
	{
		sprite_index = spr_rock_small;
		var new_rock = instance_copy(true);
		new_rock.rock_health = 50;
	}
}
else if rock_health <= 0
{
	// If dead rock
	obj_game.points += 25;
	// Respawn?
	if instance_number(obj_rock) < 6
	{
		sprite_index = spr_rock_big;
		rock_health = 100;
		x = -100;
	}
	else
	{
		instance_destroy();
	}
}