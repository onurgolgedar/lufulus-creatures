function SL_light_ini_end() {
	/* SL_light_ini_end();                         */
	/* Termine l'initialisation de l'objet lumière */

	// Variables automatiques
	global.sl_light_txsize  = sprite_get_width(sl_light_texture); // Dimensions de la texture de lumière
	sl_light_refreshcounter = (1-sl_light_refreshrate)*10+1 // Gestion de la fréquence de rafraîchissement
	sl_light_visible        = true; // Détermine si la lumière est visible ou non

	// Surface de la lumière
	sl_light_surface = -1;



}
