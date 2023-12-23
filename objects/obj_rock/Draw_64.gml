/// @description Insert description here
// You can write your code in this editor

// Get default properties to reset afterwards
var _color = draw_get_color();
var _font = draw_get_font();

// Set Font
draw_set_font(fnt_game);
if obj_game.flip_color
{
	draw_set_color(c_black);
}

draw_text(x, y, rock_health)

// reset default states
draw_set_font(_font);
draw_set_color(_color);