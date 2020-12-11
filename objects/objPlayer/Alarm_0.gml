/// @description Alpha Down
				
if (weaponAlpha > 0) {
	weaponAlpha -= 0.25
	alarm[0] = 1
}
        
if (!death)
	player_set_stance(stPose)