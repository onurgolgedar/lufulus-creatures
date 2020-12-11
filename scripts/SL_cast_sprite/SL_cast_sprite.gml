function SL_cast_sprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	/* SL_earth_sprite(layer,earth_sun,earth_ambient,earth_lights,sprite,subimg,x,y,z,xscale,yxscale,rot,alpha); */
	/* Fonction permettant d'afficher des ombres pour un sprite                                              */

	global.sl_earthlist[global.sl_earthlist_index,0]  = argument0;
	global.sl_earthlist[global.sl_earthlist_index,1]  = argument1;
	global.sl_earthlist[global.sl_earthlist_index,2]  = argument2;
	global.sl_earthlist[global.sl_earthlist_index,3]  = argument3;
	global.sl_earthlist[global.sl_earthlist_index,4]  = argument4;
	global.sl_earthlist[global.sl_earthlist_index,5]  = argument5;
	global.sl_earthlist[global.sl_earthlist_index,6]  = argument6;
	global.sl_earthlist[global.sl_earthlist_index,7]  = argument7;
	global.sl_earthlist[global.sl_earthlist_index,8]  = argument8;
	global.sl_earthlist[global.sl_earthlist_index,9]  = argument9;
	global.sl_earthlist[global.sl_earthlist_index,10] = argument10;
	global.sl_earthlist[global.sl_earthlist_index,11] = argument11;
	global.sl_earthlist[global.sl_earthlist_index,12] = argument12;

	global.sl_earthlist[global.sl_earthlist_index+1,0] = -1;
	global.sl_earthlist_index += 1;



}
