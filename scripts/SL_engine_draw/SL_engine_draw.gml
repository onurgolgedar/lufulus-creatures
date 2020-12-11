function SL_engine_draw() {
	/* SL_engine_draw();                         */
	/* Affiche l'ensemble des ombres et lumières */

	// Gestion de la synchronisation affichage/view
	var cam = global.camera

	if sl_buffer_sync
	{sl_view_xspeed = camera_get_view_x(cam)-sl_view_xprevious;
	 sl_view_yspeed = camera_get_view_y(cam)-sl_view_yprevious};
	else { sl_view_xspeed=0 sl_view_yspeed=0 };

	// Affichage des buffers
	if surface_exists(sl_buffer_surface1)
	{
	    gpu_set_blendmode_ext(bm_dest_color,bm_zero);
	    draw_surface_ext(sl_buffer_surface1,camera_get_view_x(cam)-sl_buffer_xmargin-sl_view_xspeed,camera_get_view_y(cam)-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,1);
	    gpu_set_blendmode(bm_add);
	    draw_surface_ext(sl_buffer_surface2,camera_get_view_x(cam)-sl_buffer_xmargin-sl_view_xspeed,camera_get_view_y(cam)-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,sqr(global.sl_ambient_light));
	    gpu_set_blendmode(bm_normal);
	}

	if sl_buffer_sync
	{sl_view_xprevious = camera_get_view_x(cam);
	 sl_view_yprevious = camera_get_view_y(cam)};



}
