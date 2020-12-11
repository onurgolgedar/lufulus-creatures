event_inherited()
name = eng() ? "Medical Kit II" : "Tedavi Kiti II"
description = eng() ? "Clears the death effect\n[c="+string(c_aqua)+"]Only for 10-19 levels[/c]"
: "Ölüm etkisini temizler.\n[c="+string(c_aqua)+"]10-19 seviye arasında kullanılabilir.[/c]"

efbox = efboxClearDeath

worth = 40
itemLevel = 2

dropLevel = itemLevel*7

type = type_potion

isCollectable = true