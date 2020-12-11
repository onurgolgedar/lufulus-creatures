if (test_upperclick_window())
	exit

if (global.itemSelected == -1) {
    var itemClicked = -1
    
    if (mouseOnBox)
        if (item[mouseOnBox_i, mouseOnBox_j] != -1 and !mouseOnBox_forUpgrade)
            itemClicked = item[mouseOnBox_i, mouseOnBox_j]
        
    if (itemClicked != -1 and itemClicked.upgrade > 0 and !itemClicked.passive) {
		with (contGUI) {
			for (var i = 0; i < 4; i++) {
				if (global.selectedSkill[i] == itemClicked.object_index) {
					skillSprite[i] = -1
					global.selectedSkillMaxRem[i] = -1
					global.selectedSkillRem[i] = -1
					global.selectedSkillMana[i] = -1
					global.selectedSkill[i] = -1
					tbT[i] = pointer_null
					tbW[i] = -1
					tbH[i] = -1
				}
			}
		}
		
		for (var i = 0; i < 4; i++) {
			if (global.selectedSkill[i] == -1) {
				global.selectedSkill[i] = itemClicked.object_index
				with (contGUI) event_perform(ev_other, ev_user0)
				break
			}
		}
		
		save_skills(global.saveNo)
    }
}