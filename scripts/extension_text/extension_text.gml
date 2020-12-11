/// @param extensionNo
function extension_text() {

	var isEnglish = eng()

	switch (argument[0]) {
		case ext_basicDamage10:
			return isEnglish ? "Basic attacks: +10% damage"
			: "Basit saldırılar: +%10 hasar"
		case ext_arrowSpeed10:
			return isEnglish ? "Arrows: +10% speed and range"
			: "Oklar: +%10 hız ve menzil"
		case ext_basicDamage18:
			return isEnglish ? "Basic attacks: +18% damage"
			: "Basit saldırılar: +%18 hasar"
		case ext_arrowSpeed18:
			return isEnglish ? "Arrow: +18% speed and range"
			: "Oklar: +%18 hız ve menzil"
		case ext_basicDamage26:
			return isEnglish ? "Basic attacks: +26% damage"
			: "Basit saldırılar: +%26 hasar"
		case ext_arrowSpeed26:
			return isEnglish ? "Arrow: +26% speed and range"
			: "Oklar: +%26 hız ve menzil"
		case ext_basicMagical20:
			return isEnglish ? "Basic attacks: +20% damage\nas magical"
			: "Basit saldırılar: +%20\nbonus büyü hasarı"
		case ext_basicMagical30:
			return isEnglish ? "Basic attacks: +30% damage\nas magical"
			: "Basit saldırılar: +%30\nbonus büyü hasarı"
		case ext_basicMagical40:
			return isEnglish ? "Basic attacks: +40% damage\nas magical"
			: "Basit saldırılar: +%40\nbonus büyü hasarı"
		case ext_basicStun15:
			return isEnglish ? "Basic attacks: +15%\nchance to stun"
			: "Basit saldırılar: +%15\nsersemletme ihtimali"
		case ext_basicLifeSteal3:
			return isEnglish ? "Lifesteal: +3%"
			: "Can çalma: +%3"
		case ext_basicLifeSteal6:
			return isEnglish ? "Lifesteal: +6%"
			: "Can çalma: +%6"
		case ext_criticalChance10:
			return isEnglish ? "Critical chance: +10%"
			: "Kritik İhtimali: +%10"
		case ext_poison500:
			return isEnglish ? "20% chance: Deal 500 poison\ndamage over 3 seconds"
			: "%20 ihtimalle: 3 saniye\niçinde 500 zehir hasarı verir."
		case ext_poison900:
			return isEnglish ? "18% chance: Deal 900 poison\ndamage over 4 seconds"
			: "%18 ihtimalle: 3 saniye\niçinde 900 zehir hasarı verir."
		case ext_poison1600:
			return isEnglish ? "16% chance: Deal 1600 poison\ndamage over 5 seconds"
			: "%16 ihtimalle: 3 saniye\niçinde 1600 zehir hasarı verir."
		case ext_shift_longer:
			return isEnglish ? "33% longer <Shift> duration"
			: "<Shift> %33 daha uzun sürer."
		case ext_damageReduction15:
			return isEnglish ? "Damage reduction: +15%"
			: "Hasar azaltma: +%15"
		case ext_stuncrit:
			return isEnglish ? "Absolute critical strike\nto stunned enemies"
			: "Sersemlemiş rakiplere kesin\nkritik vuruş"
		case ext_ctrl_dmg12:
			return isEnglish ? sk_0+": +12% more\ndamage"
			: sk_0+": +%12 daha\nfazla hasar"
		case ext_ctrl_dmg24:
			return isEnglish ? sk_0+": +24% more\ndamage"
			: sk_0+": +%24 daha\nfazla hasar"
		case ext_arrow_dmg12:
			return isEnglish ? "Basic arrow shots: +12% damage"
			: "Basit ok vuruşları: +%12 hasar"
		case ext_arrow_dmg20:
			return isEnglish ? "Basic arrow shots: +20% damage"
			: "Basit ok vuruşları: +%20 hasar"
		case ext_bow_completeshot30:
			return isEnglish ? "Fully-drawn basic bow\nshots: +30% damage"
			: "Tam çekilmiş ok\nsaldırıları: +%30 hasar"
		case ext_bow_quickshot_slow:
			return isEnglish ? "Less-drawn basic bow\nshots: Slow effect"
			: "Az çekilmiş ok saldırıları\nyavaşlatır."
		case ext_melee_range:
			return isEnglish ? "+10% Melee range"
			: "+%10 Yakın dövüş menzili"
		case ext_energyRegen4:
			return isEnglish ? "Basic attacks: +4 energy\nregeneration"
			: "Basit saldırılar: +4 enerji\nkazandırır."
		case ext_speed7:
			return isEnglish ? "+7% movement speed"
			: "+%7 hareket hızı"
		case ext_broccoli_recovery:
			return isEnglish ? "Broccolis recover 100%\nmore HP."
			: "Brokoliler %100 daha fazla\ncan yeniler."
		case ext_plus_upgrade:
			return isEnglish ? "Bonus Pluses are 50% more\neffective."
			: "Bonus artıları %50 daha\nfazla yenileme sağlar."
		case ext_pull_bonuses:
			return isEnglish ? "Pulls Broccolis and Bonus\nPlusses when needed."
			: "Gerektiğinde bonus artıları\nve brokoliler sana doğru çekilir."
		case ext_bowSlow:
			return isEnglish ? "Prevents bows' movement slow\nwhich is applied while focusing"
			: "Yaylar artık sen odaklanırken\nyavaşlatmaz."
		case ext_classics:
			return isEnglish ? "Each classic item you use\nincreases the chance of dodge by 8%"
			: "Kullandığın her klasik eşya\nsaldırılardan kaçınma şansını %8\narttırır."
		case ext_criticalboost:
			return isEnglish ? "After doing critical strike,\nall of your damage will be\nincreased by 25% for 1 second"
			: "Kritik vuruş uyguladıktan sonra\n1 saniyeliğine tüm gücün %25 artar."
		case ext_poisonp30:
			return isEnglish ? "Poison: +30% more powerful"
			: "Zehir: +%30 daha etkili"
		case ext_ctrl_rangedkill:
			return isEnglish ? sk_0+": 25% stronger\ntowards ranged non-boss enemies"
			: sk_0+": Üstün olmayan\nmenzilli rakiplere +%25 hasar verir."
		case ext_ctrl_wound:
			return isEnglish ? sk_0+": Decreases enemies'\nhealing by 50% for 4 seconds"
			: sk_0+": 4 saniyeliğine\nrakiplerin iyileşmesini %50 azaltır."
		case ext_fearofdeath:
			return isEnglish ? "Killing an enemy decreases near\nnon-boss enemies' fighting ability by 10%."
			: "Bir rakibi öldürmek onun\netrafındaki üstün olmayan yaratıkların\ndövüş becerilerini %10 azaltır."
		case ext_invisibility:
			return isEnglish ? "<Shift> Move: Invisibility"
			: "<Shift> Hareketi: Görünmezlik"
		case ext_nearslow:
			return isEnglish ? "Attack&movement speed is decreased\nby 15% for enemies around 4 meters"
			: "4 metre yakındaki rakiplerin\nsaldırı ve hareket hızı %15 azalır."
		case ext_poisonresist:
			return isEnglish ? "Poison resistance: +50%"
			: "Zehir direnci: +50%"
		case ext_shellcounter:
			return isEnglish ? "Basic attacks: 20% chance\nto break shells"
			: "Basit saldırılar %20\nihtimalle kabukları kırabilir."
		case ext_tenacity:
			return isEnglish ? "Stun&Slow resistance: +30%"
			: "Sersemleme ve yavaşlama\ndirencin %30 artar."
		case ext_resistance10:
			return isEnglish ? "Magical resistance: +10%"
			: "Büyü direnci: +%10"
		case ext_resistance18:
			return isEnglish ? "Magical resistance: +18%"
			: "Büyü direnci: +%18"
		case ext_resistance26:
			return isEnglish ? "Magical resistance: +26%"
			: "Büyü direnci: +%26"
		case ext_light:
			return isEnglish ? "Emits light"
			: "Işık yayar."
		case ext_med_masterMage:
			return isEnglish ? "-15% Cooldown\n+10% Skill damage\n+20% Mana regeneration"
			: "-%15 Bekleme süresi\n+%10 Yetenek hasarı\n+%20 Mana yenilenmesi"
		case ext_med_galaxy:
			return isEnglish ? "[c="+string(c_negativered)+"]Fast Movement losts 50% of\nits speed advantage.[c="+string(c_green)+"]\nFast Movement lasts +50% longer.\n+50% Energy Regeneration[/c]"
			: "[c="+string(c_negativered)+"]Hızlı Hareket %50 yavaşlar.[c="+string(c_green)+"]\nHızlı Hareket %50 daha\nuzun sürer.\n+%50 Enerji Yenilenmesi[/c]"
		case ext_med_archblue:
			return isEnglish ? "+10% Arrow damage\n+5% Movement speed\n+50% Faster weapon change"
			: "+%10 Ok hasarı\n+%5 Hareket hızı\n+%50 Silah değiştirme hızı"
		case ext_med_wors:
			return isEnglish ? "+6% Melee damage\n+3% Life steal"
			: "+%6 Yakın saldırı hasarı\n+%3 Can çalma"
		case ext_med_torach:
			return isEnglish ? "<Shift>: No more gives movement speed\nbut regenerates 25% HP per sec."
			: "<Shift>: Artık hızlandırmaz ancak\nsaniyede %25 iyileştirme sağlar."
		case ext_limb_sk0:
			return isEnglish ? sk_1+": Cuts non-boss\ncreatures' limbs by 25% chance (single).\nThis causes 10% HP true damage."
			: sk_1+": %25 ihtimalle\nnormal canavarların uzunlarını koparabilir,\ncanlarının %10'u kadar kesin hasar verir."
		case ext_shift_noslow:
			return isEnglish ? "<Shift>: Ignores all\nslow effects (shield etc.)"
			: "<Shift>: Tüm hareket yavaşlamaları\nyok sayılır. (kalkanların etkisi dahil)"
		case ext_shift_jump:
			return isEnglish ? "<Shift>: Leaping"
			: "<Shift>: İleri zıplatır."
		case ext_shift_cooldown:
			return isEnglish ? "<Shift>: 3x Faster cooldown"
			: "<Shift>: Bekleme süreleri\n3 kat hızlı azalır."
		case ext_shift_tenacity:
			return isEnglish ? "<Shift>: +80% Slow&Stun resistance"
			: "<Shift>: +%80 Sersemleme\nve yavaşlama direnci"
		case ext_critfire:
			return isEnglish ? "Critical Strikes: Refreshes\nfire&poison effects"
			: "Kritik Saldırılar: Ateş ve zehir\netkilerini yeniler."
		case ext_critlife:
			return isEnglish ? "Critical Strikes: 2x More effective\nlifesteal"
			: "Kritik Saldırılar: 2 kat daha etkili\ncan çalma"
		case ext_ctrl_crit:
			return isEnglish ? "First attack will be critical\nafter using "+sk_0+"."
			: sk_0+" kullanımından sonraki ilk\nsaldırı kritik olur."
		case ext_stats:
			return isEnglish ? "Increases all stat points by 3."
			: "Tüm statlarınızı 3 arttırır."
		case ext_regenerate_missing:
			return isEnglish ? "Regenerates your missing health\nby 5% per sec."
			: "Her saniye eksik canınızın\n%5'ini iyileştirir."
		default:
			return ""
	}


}
