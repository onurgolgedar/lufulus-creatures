event_inherited()
name = eng() ? "Medical Kit" : "Tedavi Kiti"
description = eng() ? "Clears the death effect\n[c="+string(c_aqua)+"]Only for 1-9 levels[/c]"
: "Ölüm etkisini temizler.\n[c="+string(c_aqua)+"]1-9 seviye arasında kullanılabilir.[/c]"

efbox = efboxClearDeath

worth = 7
itemLevel = 1

dropLevel = itemLevel*5

type = type_potion

isCollectable = true