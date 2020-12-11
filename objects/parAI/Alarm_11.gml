var _delta = 0.015*delta()
if (healthBarP-_delta > hp/maxHp) {
    healthBarP -= _delta
    alarm[11] = 1
}
else
    healthBarP = hp/maxHp