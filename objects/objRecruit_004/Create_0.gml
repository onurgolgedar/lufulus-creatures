event_inherited()

name = eng() ? "Call Warrior (Level 25)" : "Savaşçı Çağır (Seviye 25)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_4)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_4)+" altın[/c]"

efbox = efboxRecruitedWarrior4

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true