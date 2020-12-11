event_inherited()
name = eng() ? "Medical Kit III" : "Tedavi Kiti III"
description = eng() ? "Clears the death effect\n[c="+string(c_aqua)+"]Only for 20-29 levels[/c]"
: "Ölüm etkisini temizler.\n[c="+string(c_aqua)+"]20-29 seviye arasında kullanılabilir.[/c]"

efbox = efboxClearDeath

worth = 120
itemLevel = 3

dropLevel = itemLevel*8

type = type_potion

isCollectable = true