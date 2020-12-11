var right, rightTop, top, leftTop, left, leftBottom, bottom, rightBottom
right = false
rightTop = false
top = false
leftTop = false
left = false
leftBottom = false
bottom = false
rightBottom = false

// Wall Counting
for (var i = 0; i <= 315; i += 45)
    if (position_meeting(x+lengthdir_x(50, i+image_angle), y+lengthdir_y(50, i+image_angle), parRock)) {
        if (i == 0)
            right = true
        else if (i == 45)
            rightTop = true
        else if (i == 90)
            top = true
        else if (i == 135)
            leftTop = true
        else if (i == 180)
            left = true
        else if (i == 225)
            leftBottom = true
        else if (i == 270)
            bottom = true
        else if (i == 315)
            rightBottom = true
    }
	
noOutline = false
if (right and left and bottom and top) {
	noOutline = true
	phy_active = false
}