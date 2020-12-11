drawGamepadControlWindow = is_outfight() and !has_active_sweapon()
drawGamepadControlAttack = instance_number(parCreature) > 0
drawGamepadControlSwitchMode = is_quest_finished(objQuestRoad_scout)

alarm[0] = sec/2