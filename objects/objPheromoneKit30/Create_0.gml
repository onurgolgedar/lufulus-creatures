event_inherited()
name = eng() ? "Pheromone Kit IV" : "Feromon Kiti IV"
description = eng() ? "Causes all creatures nearby\n30 meters to attack you.\n(Only for non-bosses)\n\n[c="+string(c_aqua)+"]Get 30% EXP bonus from the\nattackers affected.[/c]"
: "30 metre yakındaki yaratıkların\nsize saldırmasına neden olur.\n(Üstün yaratıklar hariçtir.)\n\n[c="+string(c_aqua)+"]Etkilenen saldırganlardan %30\nfazla tecrübe kazanılır.[/c]"

efbox = efboxPheromone30

worth = 600
itemLevel = 1

dropLevel = itemLevel*10

type = type_potion

isCollectable = true