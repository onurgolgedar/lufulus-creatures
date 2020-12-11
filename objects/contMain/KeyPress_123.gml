var screenShot = "Lufulus_Creatures_"+string(irandom_range(10000, 99999))+string(global.gameTime)+".png"
screen_save(screenShot)

if (steam_initialised())
	steam_send_screenshot(screenShot, view_get_wport(0), view_get_hport(0))