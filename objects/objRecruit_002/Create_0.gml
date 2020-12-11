event_inherited()

name = eng() ? "Call Warrior (Level 15)" : "Savaşçı Çağır (Seviye 15)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_2)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_2)+" altın[/c]"

efbox = efboxRecruitedWarrior2

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true