function macros() {
#macro IS_MOBILE false//(os_type == os_android or os_type == os_ios)
#macro JOYSTICK_CENTER_X 190
#macro JOYSTICK_CENTER_Y display_get_gui_height()-200
#macro JOYSTICK_R 90
#macro JOYSTICK2_CENTER_X display_get_gui_width()-215
#macro JOYSTICK2_CENTER_Y display_get_gui_height()-215
#macro JOYSTICK2_R 108
#macro BUTTON_SPEEDBOOST_X JOYSTICK2_CENTER_X+20
#macro BUTTON_SPEEDBOOST_Y JOYSTICK2_CENTER_Y-160
#macro BUTTON_MAIN_X JOYSTICK2_CENTER_X-160
#macro BUTTON_MAIN_Y JOYSTICK2_CENTER_Y
#macro BUTTON_SKILL1_X JOYSTICK2_CENTER_X-135
#macro BUTTON_SKILL1_Y JOYSTICK2_CENTER_Y-75
#macro BUTTON_SKILL2_X JOYSTICK2_CENTER_X-75
#macro BUTTON_SKILL2_Y JOYSTICK2_CENTER_Y-135
#macro BUTTON_WEAPONCHANGE_X JOYSTICK2_CENTER_X+20
#macro BUTTON_WEAPONCHANGE_Y JOYSTICK2_CENTER_Y-255

#region General Values
#macro sec 60
#macro fps_free 0
#macro fps_average -1
#macro unique_number 1453.45 // >11
#macro default_string "-123"
#macro VERSION 1.14
#macro lang_english 1
#macro lang_turkish 0
#macro steam_leaderboard_name "General Score"

#macro windowColor c_black
#macro windowColor_main $97C336
#endregion

#region Control Values
#macro LEVEL_MAX 40
#macro VIEWCIRCLE_MAX 12
#macro NPC_CLICKDISTANCE 300
#macro CIRCLE_PRECISION IS_MOBILE ? 80 : 100

#macro DROP_GOLD_RATIO 1+3
#macro ITEM_WORTH_RATIO 1
#macro ITEM_PRICE_RATIO 2.25
#macro ITEM_UNIQUE_SPECIALTY 65
#macro BANK_EMPTYPAGEBONUS_RATIO 0.3
#macro BANK_RENT_RATIO 0.07
#macro BANK_INTEREST_RATIO 0.02
#macro BANK_INTEREST_RATIO_PERTITLE 0.02
#macro WEAPON_BOW_SLOWFACTOR 2.28
#macro WEAPON_MELEE_IMPULSE_RATIO 1

#macro RECRUIT_LOW_WARRIOR_EXPENSE_1 60
#macro RECRUIT_LOW_WARRIOR_EXPENSE_2 140
#macro RECRUIT_WARRIOR_EXPENSE_1 240
#macro RECRUIT_WARRIOR_EXPENSE_2 750
#macro RECRUIT_WARRIOR_EXPENSE_3 2600
#macro RECRUIT_WARRIOR_EXPENSE_4 5300
#endregion

#region Team
#macro team_player 1
#macro team_enemy 2
#macro team_neutralFriend 3 // does not protect (but prevents damage taking)
#endregion

#region AI Modes
#macro md_nothing 7
#macro md_calm 8
#macro md_attack 9
#macro md_waiting 10
#endregion

#region Other Values
#macro leader_text (eng() ? "Leader " : "Lider ")
#macro choice_1 456
#macro choice_2 567
#macro choice_3 678
#macro choice_4 789
#endregion

#region Colors [BLUEGREENRED]
#macro c_gold $00D6FE
#macro c_ltpink $C1B7FF
#macro c_brown $2D5986
#macro c_niceblue $FFCCCC
#macro c_nicered $5050F0
#macro c_dkblue $280000
#macro c_broccoli $E1FFE1
#macro c_ltyellow $64FFFF
#macro c_hardgray $1E1E1E
#macro c_ltgray2 $F0F0F0
#macro c_textbox $191919
#macro c_negativered $7878FF
#macro c_nicepurple $FF99BB
#macro c_dkorange $004BC8
#macro c_ltorange $91C3FA
#macro c_ltblue $EBA0A0
#macro c_ltgreen $91F591
#macro c_buttoncolorspecial $787878
#macro c_challenge $FFEC00

#macro c_customyellow $328282
#macro c_customblue $C82828
#macro c_customgreen $50B450
#macro c_customgreen2 $28C828
#macro c_customred1 $474768
#macro c_customred2 $37375D
#macro c_customred3 $262652
#macro c_customred4 $131347
#macro c_customred_compare $9696FA
#macro c_customgreen_compare $96FA96
#endregion

#region Warrior Category
#macro recruited_low_1 -6
#macro recruited_low_2 -5
#macro recruited_4 -4
#macro recruited_3 -3
#macro recruited_2 -2
#macro recruited_1 -1

#macro melee_xlight 0
#macro melee_light 1
#macro melee_normal 2
#macro melee_heavy 3
#macro melee_xheavy 4
#macro melee_xxheavy 5

#macro ranged_light 5
#macro ranged_normal 6
#macro ranged_heavy 7
#endregion

#region Skills
#macro sk_earthmove 3
#macro sk_shock 4
#macro sk_rofux 5
#macro sk_laser 6

#macro sk_0 (eng() ? "Supershock" : "Süperşok")
#macro sk_1 (eng() ? "Wide Sword Attack" : "Geniş Kılıç Saldırısı")
#macro sk_2 (eng() ? "Safe Move" : "Güvenli Hamle")
#macro sk_3 (eng() ? "Bloody Boost" : "Kanlı Enerji")
#macro sk_4 (eng() ? "Natural Resistance" : "Doğal Dayanıklılık")
#macro sk_5 (eng() ? "Gray Bang" : "Gri Patlama")
#macro sk_6 (eng() ? "Radiat Power" : "Radiat Gücü")
#macro sk_7 (eng() ? "Wamper" : "Vamper")
#macro sk_8 (eng() ? "Penta Shot" : "Beşli Atış")
#macro sk_9 (eng() ? "Massive Shot" : "Güçlü Atış")
#macro sk_10 (eng() ? "Glacial Shot" : "Buzul Atış")
#macro sk_11 (eng() ? "Bolt Strike" : "Yüksek Saldırı")
#macro sk_12 (eng() ? "Fire Nova" : "Ateş Novası")
#macro sk_13 (eng() ? "Dark Remedy" : "Kara Deva")
#macro sk_14 (eng() ? "Madness" : "Çılgınlık")
#endregion

#region Skill&Passive Values
#macro sv_soulSteal_range 200
#macro sv_fury_increase 20
#macro sv_sk1_bleedingRatio 1.2
#endregion

#region Moves
#macro move_basicAttack 3
#macro move_strike_begin 4
#macro move_strike 5
#macro move_turtle 6
#macro move_slowstone 7
#macro move_earthmove_1 8
#macro move_earthmove_2 9
#macro move_sprayPoison 10
#macro move_basicHeal 11
#macro move_brainAttack 12
#macro move_pull 13
#endregion

#region Location Names
#macro loc_beforeroad (eng() ? "Near Hawmgrad" : "Hawmgrad Yakınları")
#macro loc_road (eng() ? "Hawmgrad Road" : "Hawmgrad Yolu")

#macro loc_hawmgrad "Hawmgrad"
#macro loc_belingfur "Belingfur"
#macro loc_frozendesert (eng() ? "The Frozen Desert" : "Buzul Kumlar")
#macro loc_taryah (eng() ? "Taryah City" : "Taryah Kenti")
#macro loc_eltemur "Eltemur"
#macro loc_rivermore (eng() ? "Rivermore Field" : "Rivermore Bölgesi")
#macro loc_ruins (eng() ? "The Ruins" : "Harabeler")
#macro loc_crack (eng() ? "The Crack" : "Kırık")
#macro loc_lufulus (eng() ? "Lufulus' Arena" : "Lufulus'un Arenası")

#macro loc_camp1 (eng() ? "Rebel Camp" : "Asiler Kampı")
#macro loc_warzone (eng() ? "War Zone" : "Harp Meydanı")
#macro loc_warzone2 (eng() ? "War Zone 2" : "Harp Meydanı 2")
#macro loc_mineralcave (eng() ? "Mineral Cave" : "Mineral Kapanı")

#macro loc_spawn0 (eng() ? "Hawmgrad's Plain" : "Hawmgrad Arazisi")
#macro loc_spawn1 (eng() ? "Ler'in Forest" : "Ler'in Ormanı")
#macro loc_spawn2 (eng() ? "Ler'in Forest II" : "Ler'in Ormanı II")
#macro loc_spawn3 (eng() ? "Further Ler'in" : "Uzak Ler'in")
#macro loc_spawn4 (eng() ? "The Blue Cave" : "Mavi Kapan")
#macro loc_spawn5 (eng() ? "Giant Desert" : "Devler Kumu")
#macro loc_spawn6 (eng() ? "The Ice Cage" : "Buz Kapanı")
#macro loc_spawn7 (eng() ? "Soul Land" : "Ruhlar Bölgesi")
#macro loc_spawn8 (eng() ? "Pinky Forest" : "Pinky Ormanı")
#macro loc_spawn9 (eng() ? "Force Land" : "Kudret Toprakları")
#macro loc_spawn10 (eng() ? "Magical Plants" : "Büyülü Bitkiler")

#macro loc_wave1 (eng() ? "Creature Valley" : "Yaratık Vadisi")
#macro loc_wave2 (eng() ? "Dark Forest" : "Karanlık Orman")
#macro loc_wave3 (eng() ? "Bloody Forest" : "Kanlı Orman")
#macro loc_wave4 (eng() ? "Sands of\nthe Nightmare" : "Kabus Kumları")
#endregion

#region Location Levels
#macro loc_level_wave1 5
#macro loc_level_wave2 10
#macro loc_level_wave3 15
#macro loc_level_wave4 18
#endregion

#region NPC Names
#macro npc_scout ""
#macro npc_lorddamph "Damph"
#macro npc_goore "Goore"
#macro npc_elise "Elise"
#macro npc_senior "Senior"
#macro npc_trogen "Trogen"
#macro npc_lordred "Redkhar"
#endregion

#region Creature Names
#macro creature_0 "Vang"
#macro creature_1 "Thradea"
#macro creature_2 "Mutant Thradea"
#macro creature_3 "Sly Mbie"
#macro creature_4 "Rolf"
#macro creature_5 "Toruk"
#macro creature_6 "Skrex"
#macro creature_7 "Kazrin"
#macro creature_8 (eng() ? "Pink Srada" : "Pembe Srada")
#macro creature_9 "Hob"
#macro creature_10 "Fowrad"
#macro creature_11 "Crak"
#macro creature_12 "Grell"
#macro creature_13 "Within"
#macro creature_a1 "Vurac"
#macro creature_a2 (eng() ? "Heavy Vurac" : "Ağır Vurac")
#macro creature_g1 "Bomi"
#macro creature_g2 "Bomicar"
#macro creature_b1 "Talrog"
#macro creature_b2 "Lufulus' Guardian"
#macro creature_lufulus "Lufulus"
#macro creature_w1 "Blue Folsar"
#macro creature_w2 "Jeebis"
#macro creature_w3 "Pyvark"
#macro creature_w4 "Bulltig"
#endregion

#region Windows
#macro window_items 3
#macro window_trade 4
#macro window_skills 5
#macro window_quests 6
#macro window_imtrade 7
#macro window_bank 8
#macro window_imbank 9
#macro window_actives 10
#endregion

	// ! Do not change the values, it affects save files.
#region Extensions
#macro ext_basicMagical20 3
#macro ext_basicStun15 4
#macro ext_basicLifeSteal3 5
#macro ext_criticalChance10 6
#macro ext_basicLifeSteal6 7
#macro ext_poison500 8
#macro ext_poison900 9
#macro ext_poison1600 10
#macro ext_shift_longer 11
#macro ext_damageReduction15 12
#macro ext_stuncrit 13
#macro ext_bow_completeshot30 14
#macro ext_bow_quickshot_slow 15
#macro ext_basicDamage10 16
#macro ext_basicDamage18 17
#macro ext_basicDamage26 18
#macro ext_arrowSpeed10 19
#macro ext_arrowSpeed18 20
#macro ext_arrowSpeed26 21
#macro ext_ctrl_dmg12 22
#macro ext_ctrl_dmg24 23
#macro ext_arrow_dmg12 24
#macro ext_arrow_dmg20 25
#macro ext_bowSlow 26
#macro ext_ctrl_wound 27
#macro ext_shellcounter 28
#macro ext_criticalboost 29
#macro ext_fearofdeath 30
#macro ext_nearslow 31
#macro ext_poisonresist 32
#macro ext_tenacity 33
#macro ext_ctrl_rangedkill 34
#macro ext_poisonp30 35
#macro ext_invisibility 37
#macro ext_basicMagical30 38
#macro ext_basicMagical40 39
#macro ext_resistance10 40
#macro ext_resistance18 41
#macro ext_resistance26 42
#macro ext_melee_range 43
#macro ext_limb_sk0 45
#macro ext_shift_noslow 46
#macro ext_shift_jump 47
#macro ext_shift_cooldown 48
#macro ext_shift_tenacity 49
#macro ext_critfire 50
#macro ext_critlife 51
#macro ext_ctrl_crit 52
#macro ext_stats 53
#macro ext_regenerate_missing 54

#region 800's are at +4
#macro ext_energyRegen4 800
#macro ext_speed7 801
#macro ext_classics 802
#macro ext_broccoli_recovery 803
#macro ext_pull_bonuses 804
#macro ext_plus_upgrade 805
#endregion

#region 900's are at +0
#macro ext_light 900 
#endregion

#region 700's are for medallions
#macro ext_med_masterMage 700
#macro ext_med_archblue 701
#macro ext_med_wors 702
#macro ext_med_galaxy 703
#macro ext_med_torach 704
#endregion

#endregion

#region Types
#macro type_value3 -16
#macro type_value2 -15
#macro type_value -14
#macro type_magicaldamage -13
#macro type_physicaldamage -12
#macro type_duration -11
#macro type_player -10
#macro type_kador -9
#macro type_grom -8
#macro type_npc -7
#macro type_wisdom -6

#macro type_valuable -4
#macro type_noitem -3

#macro type_clothes 7
#macro type_mweapon 8
#macro type_sweapon 9
#macro type_medallion 10
#macro type_necklace 11
#macro type_skill 12
#macro type_hair 13
#macro type_potion 14
#macro type_pet 15
#macro type_quest 16
#macro type_material 17
#macro type_challengeItem 18
#macro type_call 19
#endregion

#region Creature Secondary Types
#macro stype_crokador 3
#macro stype_gronel 4
#macro stype_npc 5
#macro stype_gorkrim 6
#endregion

#region Weapon Types
#macro wtype_ohsword 3
#macro wtype_shield 4
#macro wtype_crossbow 5
#macro wtype_staff 6
#macro wtype_bow 7
#endregion

#region Animation Stances
#macro stPull -26
#macro stPull2 -25
#macro stBrainAttack2 -24
#macro stBrainAttack1 -23
#macro stBasicHeal -22
#macro stBase -21
#macro stBase2 -20
#macro stBase3 -19
#macro stBaRanged2_right -18
#macro stBaRanged2_left -17
#macro stBaRanged_right -16
#macro stBaRanged_left -15
#macro stBaNormal -14
#macro stBaNormal2 -13
#macro stTurtleMode -12
#macro stStrikeMode -11
#macro stSlowStoneMove1 -10
#macro stSlowStoneMove2 -9
#macro stEarthMove1 -8
#macro stEarthMove2 -7

#macro stBasicAttackBase_ohsword 3
#macro stBasicAttackBase_staff 4
#macro stBasicAttackBase_shieldOnly 5
#macro stBasicAttackBase_crossbow 6
#macro stSafe 7
#macro stBasicAttack_ohsword 8
#macro stBasicAttack_ohsword_2 9
#macro stBasicAttack_ohsword_3 10
#macro stBasicAttack_crossbow 11
#macro stBeforeBasicAttack_ohsword 12
#macro stBasicAttack_ohsword_4 13
#macro stBeforeBasicAttack_ohsword_2 14
#macro stSerious 15
#macro stBeforeBasicAttack_ohsword_3 16
#macro stShieldMode 17
#macro stWounded 18
#macro stBasicAttackBase_ohsword_calm 19
#macro stSkill1 20
#macro stSkill1_2 21
#macro stBasicAttackBase_bow 22
#macro stBasicAttack_bow_ready 23
#macro stBasicAttack_bow_fire 24
#macro stNormal 25
#macro stNormal2 26
#macro stPose 27
#macro stOpenArms 28
#endregion

	// ?
	// !
	// IMPORTANT - UPDATE THE LOAD_ALL's PROCESS
#region Title
#macro title_strong (eng() ? "Strong" : "Güçlü")
#macro title_lordstrust (eng() ? "Reliable" : "Güvenilir")
#macro title_loyal (eng() ? "Loyal" : "Sadık")
#macro title_honorable (eng() ? "Honorable" : "Onurlu")
#endregion


}
