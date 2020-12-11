if (image_alpha > 0) {
    image_alpha -= 1/6*delta()
    alarm[2] = 1
}
else
    instance_destroy()