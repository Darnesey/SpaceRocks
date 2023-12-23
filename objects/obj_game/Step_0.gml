/// @description Insert description here
// You can write your code in this editor

if points >= 50 && !next_level
{
	alarm[3] = 10;
	next_level = true;
}

if keyboard_check_pressed(vk_escape)
{
	paused = !paused;
	if !paused
	{
		instance_activate_all();
		surface_free(paused_surf);
		paused_surf = -1;
	}
}

if paused
{
	alarm[1]++;
	alarm[2]++;
}
