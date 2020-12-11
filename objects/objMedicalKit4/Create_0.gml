event_inherited()
name = eng() ? "Medical Kit IV" : "Tedavi Kiti IV"
description = eng() ? "Clears the death effect\n[c="+string(c_aqua)+"]Only for 30-40 levels[/c]"
: "Ölüm etkisini temizler.\n[c="+string(c_aqua)+"]30-40 seviye arasında kullanılabilir.[/c]"

efbox = efboxClearDeath

worth = 300
itemLevel = 4

dropLevel = itemLevel*9

type = type_potion

isCollectable = true