event_inherited()

maxTime = 100*sec
time = maxTime

description = eng() ? "[c="+string(c_red)+"]Death Effect[/c]\n\nYou survived death.\n[c="+string(c_nicered)+"]HP cannot be above 75%.[/c]\n\nTotal Duration: 100 seconds\n[c="+string(c_aqua)+"]Some effects can be deleted.[/c]" : "[c="+string(c_red)+"]Ölüm Etkisi[/c]\n\nÖlümden kurtuldun.\n[c="+string(c_nicered)+"]Can değerin %75'in üzerine çıkamaz.[/c]\n\nToplam Süre: 100 saniye[c="+string(c_aqua)+"]\nBazı etkiler kaldırılabilir.[/c]"

deletable = false
permanent = true

alarm[11] = 1
delta_alarm(10, irandom_range(sec/4-3, sec/4+3))