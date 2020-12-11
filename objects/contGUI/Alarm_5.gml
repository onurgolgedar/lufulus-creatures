minute += (minute < 10)*irandom_range(0, 10)+(minute < 20)*irandom_range(0, 10)+(minute < 50)*irandom_range(0, 10)+2*(minute < 58)
minute = min(59, minute)

ltext_daytime = eng() ? (string(get_day())+". Day, Time "+string(get_dayhour())+":"+string_return("0", minute < 10)+string(minute)) : (string(get_day())+". Gün, Saat "+string(get_dayhour())+":"+string_return("0", minute < 10)+string(minute))