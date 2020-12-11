event_inherited()

name = eng() ? "Call Warrior (Level 3)" : "Savaşçı Çağır (Seviye 3)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_LOW_WARRIOR_EXPENSE_1)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_LOW_WARRIOR_EXPENSE_1)+" altın[/c]"

efbox = efboxRecruitedLowWarrior1

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true