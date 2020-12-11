xImpulse = random_range(-0.15, 0.15)
yImpulse = random_range(-0.4, -0.7)+0.35*short
physics_apply_impulse(x, y, xImpulse, yImpulse)

with (objSlidingText) {
	if (id != other.id and (owner == other.owner or color == c_gold)
	and color == other.color) {	
		if (alarm[0] > alarm_max[0]/2) {
			if (!is_string(value) and !is_string(other.value)) {
				value += other.value
				excl = excl or other.excl
				str = string(value)+string_return("!", excl)
			}
			
			if (image_alpha < 1.1)
				image_alpha = image_alpha+0.15
				
			instance_destroy(other)
			exit
		}
	}
}

draw_set_font(fontSlidingValue)
	str = string(value)+string_return("!", excl)
	/*strWidth = string_width(str)
	backColor = make_color_rgb(max(color_get_red(color)/2.3-25, 0), max(color_get_green(color)/2.3-25, 0), max(color_get_blue(color)/2.3-25, 0))*/
draw_set_font(global.mainFont)

isCircle = (color == c_gold)

visible = true