event_inherited()

name = eng() ? "Call Warrior (Level 10)" : "Savaşçı Çağır (Seviye 10)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_1)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_1)+" altın[/c]"

efbox = efboxRecruitedWarrior1

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true