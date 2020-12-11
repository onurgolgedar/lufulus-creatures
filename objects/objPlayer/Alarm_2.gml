/// @description Secondary Bar Alpha Down

var _delta = 0.01*delta()

if (healthBarP-_delta > hp/maxHp) {
    healthBarP -=_delta
    delta_alarm(2, 3)
}
else
    healthBarP = hp/maxHp
    
if (manaBarP-_delta > mana/maxMana) {
    manaBarP -= _delta
    delta_alarm(2, 3)
}
else
    manaBarP = mana/maxMana
    
if (energyBarP-_delta*2.5 > energy/100) {
    energyBarP -= _delta*2.5
    delta_alarm(2, 3)
}
else
    energyBarP = energy/100