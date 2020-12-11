/// @description Last Alarm

with (owner) {
	change_hp(basicHealPower)
	basicheal_change(-100)
	
	instance_create(x, y, efBasicHeal)
}

event_perform(ev_other, ev_user5)

instance_destroy()