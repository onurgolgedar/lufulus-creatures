function SL_light_free() {
	/* SL_light_free();                                            */
	/* Libère la mémoire occupée par la surface de l'objet lumière */

	free_surface(sl_light_surface);
	sl_light_surface = -1;



}
