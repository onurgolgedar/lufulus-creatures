function test_upperclick_gui() {
	return instance_exists(contGUI) and (contGUI.mouseOnMLogo or contGUI.mouseOnSLogo or contGUI.mouseOnQLogo or contGUI.mouseOnBLogo or
		   contGUI.mouseOnCLogo or contGUI.mouseOnFindButton or contGUI.mouseOnSkillBox[0] or contGUI.mouseOnSkillBox[1] or
		   contGUI.mouseOnSkillBox[2] or contGUI.mouseOnSkillBox[3] or contGUI.mouseOnSkillBox[4])


}
