if (!position_meeting(x, y, objCaster))
	instance_create_layer(x-25, y-25, "lyInvisible", objCaster)

image_speed = 0

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
    if (position_meeting(x+lengthdir_x(sprite_width, i+image_angle), y+lengthdir_y(sprite_width, i+image_angle), parWall)) {
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
    
// 0 Wall
if (!right and !left and !top and !bottom)
    image_index = 1
// 1 Wall
else if (right and !left and !top and !bottom)
    image_index = 3
else if (!right and left and !top and !bottom)
{
    image_index = 3
    phy_rotation += -180
}
else if (!right and !left and top and !bottom)
{
    image_index = 3
    phy_rotation += -90
}
else if (!right and !left and !top and bottom)
{
    image_index = 3
    phy_rotation += -270
}
// 2 Walls
else if (right and !left and top and !bottom)
{
    // Diagonal Wall Control
    if (!rightTop)
        image_index = 6
    else
        image_index = 2
}
else if (!right and left and top and !bottom)
{
    // Diagonal Wall Control
    if (!leftTop)
        image_index = 6
    else
        image_index = 2
        
    phy_rotation += -90
}
else if (!right and left and !top and bottom)
{
    // Diagonal Wall Control
    if (!leftBottom)
        image_index = 6
    else
        image_index = 2
        
    phy_rotation += -180
}
else if (right and !left and !top and bottom)
{
    // Diagonal Wall Control
    if (!rightBottom)
        image_index = 6
    else
        image_index = 2
        
    phy_rotation += -270
}
else if (right and left and !top and !bottom)
{
    image_index = 0
    phy_rotation += -90
}
else if (!right and !left and top and bottom)
    image_index = 0
// 3 Walls
else if (right and !left and top and bottom)
{
    // Diagonal Wall Control
    if (rightTop and rightBottom)
        image_index = 4
    else if (!rightTop and rightBottom)
        image_index = 13
    else if (rightTop and !rightBottom)
    {
        image_index = 13
        image_yscale *= -1
    }
    else if (!rightTop and !rightBottom)
        image_index = 12
}
else if (!right and left and top and bottom)
{
    // Diagonal Wall Control
    if (leftTop and leftBottom)
        image_index = 4
    else if (leftTop and !leftBottom)
        image_index = 13
    else if (!leftTop and leftBottom)
    {
        image_index = 13
        image_yscale *= -1
    }
    else if (!leftTop and !leftBottom)
        image_index = 12
        
    phy_rotation += -180
}
else if (right and left and !top and bottom)
{
    // Diagonal Wall Control
    if (rightBottom and leftBottom)
        image_index = 4
    else if (!rightBottom and leftBottom)
        image_index = 13
    else if (rightBottom and !leftBottom)
    {
        image_index = 13
        image_yscale *= -1
    }
    else if (!rightBottom and !leftBottom)
        image_index = 12
        
    phy_rotation += -270
}
else if (right and left and top and !bottom)
{
    // Diagonal Wall Control
    if (rightTop and leftTop)
        image_index = 4
    else if (rightTop and !leftTop)
        image_index = 13
    else if (!rightTop and leftTop)
    {
        image_index = 13
        image_yscale *= -1
    }
    else if (!rightTop and !leftTop)
        image_index = 12
        
    phy_rotation += -90
}
// 4 Walls
else if (right and left and top and bottom)
{
    // 3 Diagonal Walls
    if (rightTop and leftTop and leftBottom and rightBottom)
        image_index = 5
    else if (!rightTop and leftTop and leftBottom and rightBottom)
        image_index = 7
    else if (rightTop and !leftTop and leftBottom and rightBottom)
    {
        image_index = 7
        phy_rotation += -90
    }
    else if (rightTop and leftTop and !leftBottom and rightBottom)
    {
        image_index = 7
        phy_rotation += -180
    }
    else if (rightTop and leftTop and leftBottom and !rightBottom)
    {
        image_index = 7
        phy_rotation += -270
    }
    
    // 2 Diagonal Walls
    else if (!rightTop and leftTop and leftBottom and !rightBottom)
        image_index = 8
    else if (!rightTop and !leftTop and leftBottom and rightBottom)
    {
        image_index = 8
        phy_rotation += -90
    }
    else if (rightTop and !leftTop and !leftBottom and rightBottom)
    {
        image_index = 8
        phy_rotation += -180
    }
    else if (rightTop and leftTop and !leftBottom and !rightBottom)
    {
        image_index = 8
        phy_rotation += -270
    }
    else if (rightTop and !leftTop and leftBottom and !rightBottom)
        image_index = 11
    else if (!rightTop and leftTop and !leftBottom and rightBottom)
    {
        image_index = 11
        phy_rotation += -90
    }
    
    // 1 Diagonal Wall
    else if (rightTop and !leftTop and !leftBottom and !rightBottom)
        image_index = 9
    else if (!rightTop and leftTop and !leftBottom and !rightBottom)
    {
        image_index = 9
        phy_rotation += -90
    }
    else if (!rightTop and !leftTop and leftBottom and !rightBottom)
    {
        image_index = 9
        phy_rotation += -180
    }
    else if (!rightTop and !leftTop and !leftBottom and rightBottom)
    {
        image_index = 9
        phy_rotation += -270
    }
    else if (!rightTop and !leftTop and !leftBottom and !rightBottom)
        image_index = 10
}