event_inherited()

name = eng() ? "Call Warrior (Level 20)" : "Savaşçı Çağır (Seviye 20)"
description = eng() ? "Daily Expense: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_3)+" gold[/c]" : "Günlük Gider: [c="+string(c_gold)+"]"+string(RECRUIT_WARRIOR_EXPENSE_3)+" altın[/c]"

efbox = efboxRecruitedWarrior3

worth = 0
itemLevel = 1

dropLevel = itemLevel

type = type_call

isCollectable = true