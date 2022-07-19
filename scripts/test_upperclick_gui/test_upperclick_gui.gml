function test_upperclick_gui() {
	return instance_exists(contGUi) and (contGUi.mouseOnMLogo or contGUi.mouseOnSLogo or contGUi.mouseOnQLogo or contGUi.mouseOnBLogo or
		   contGUi.mouseOnCLogo or contGUi.mouseOnFindButton or contGUi.mouseOnSkillBox[0] or contGUi.mouseOnSkillBox[1] or
		   contGUi.mouseOnSkillBox[2] or contGUi.mouseOnSkillBox[3] or contGUi.mouseOnSkillBox[4])


}
