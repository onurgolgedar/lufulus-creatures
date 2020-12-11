event_inherited()

name = eng() ? "Call Warrior (Level 6)" : "Savaşçı Çağır (Seviye 6)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_LOW_WARRIOR_EXPENSE_2)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_LOW_WARRIOR_EXPENSE_2)+" altın[/c]"

efbox = efboxRecruitedLowWarrior2

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true