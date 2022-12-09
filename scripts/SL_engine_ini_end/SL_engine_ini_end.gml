function SL_engine_ini_end() {
	/* SL_engine_ini_end();                */
	/* Termine l'initialisation du système */

	var i;
	var cam = global.camera

	if sl_ambient_color        = -1  sl_ambient_color        = make_color_rgb(sl_tod[sl_tod_index,1],sl_tod[sl_tod_index,2],sl_tod[sl_tod_index,3]); // Couleur de la lumière ambiante
	if global.sl_ambient_light = -1  global.sl_ambient_light = sl_tod[sl_tod_index,4]; // Puissance de la lumière ambiante

	global.sl_light_gbuffer       = -1; // Surface du buffer global pour le rendu des lumières
	//global.sl_lightlist[0]      = -1; // Liste les objets light
	global.sl_earthlist[0,0]       = -1; // Liste les valeurs des draw effectués avec SL_earth_sprite
	global.sl_earthlist_index      = 0;  // Gestion de la liste sl_earthlist
	global.sl_texlist_light[0,0]  = -1; // Liste les valeurs des draw effectués avec SL_draw_sprite_light
	global.sl_texlist_light_index = 0;  // Gestion de la liste sl_texlist_light
	global.sl_texlist_shad[0,0]   = -1; // Liste les valeurs des draw éffectués avec SL_draw_sprite_shadow
	global.sl_texlist_shad_index  = 0;  // Gestion de la liste sl_texlist_shad

	// Variables relatives à la synchronisation affichage/buffer
	if sl_buffer_sync
	{if sl_buffer_xmargin = -1 { if camera_get_view_speed_x(cam)>=0 sl_buffer_xmargin=camera_get_view_speed_x(cam)+5 else sl_buffer_xmargin=10 } // Marges du buffer
	 if sl_buffer_ymargin = -1 { if camera_get_view_speed_y(cam)>=0 sl_buffer_ymargin=camera_get_view_speed_y(cam)+5 else sl_buffer_ymargin=10 }}
	else { sl_buffer_xmargin = 0 sl_buffer_ymargin = 0 }
	sl_view_xprevious = camera_get_view_x(cam); // Coordonnées de la view au step précédent
	sl_view_yprevious = camera_get_view_y(cam);
	sl_view_xspeed    = 0; // Vitesse de déplacement de la view
	sl_view_yspeed    = 0;

	// Surfaces des layers
	for (i=0; i<sl_layers_count; i+=1) sl_layers_surface[i] = -1;

	// Variables relatives aux ombres solaires
	if sl_sunshadows_layerscale[0] = -1 for (i=0; i<sl_layers_count; i+=1) sl_sunshadows_layerscale[i] = (i+1)*(1/(sl_layers_count+1)); // Facteurs d'étirement des ombres solaires pour les différents layers
	sl_sunshadows_refreshcounter   = sl_sunshadows_refreshrate; // Gestion de la fréquence de rafraîchissement des ombres solaires
	sl_sunshadows_light            = 1; // Gestion de la luminosité des ombres solaires
	sl_sunshadows_margin           = max(sl_sunshadows_margin,sl_buffer_xmargin,sl_buffer_ymargin);

	// Surfaces des ombres solaires
	sl_sunshadows_surface1[0] = -1;
	sl_sunshadows_surface1[1] = -1;
	sl_sunshadows_surface2    = -1;

	// Surface des ombres ambiantes
	sl_ambientshadows_surface = -1;

	// Surfaces du buffer
	sl_buffer_surface1 = -1;
	sl_buffer_surface2 = -1;
	sl_buffer_width    = 0;
	sl_buffer_height   = 0;



}
