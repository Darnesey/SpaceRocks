/// @description Insert description here
// You can write your code in this editor
if keyboard_check(vk_up)
{
	motion_add(image_angle, 0.1);
}
if keyboard_check(ord("W"))
{
	motion_add(image_angle, 0.1);
}

image_angle = point_direction(x, y, mouse_x, mouse_y);
move_wrap(true, true, 0)

// Fire missiles
if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x, y, "Instances", obj_bullet);
}
if keyboard_check(vk_space)
{
	instance_create_layer(x, y, "Instances", obj_bullet);
}
