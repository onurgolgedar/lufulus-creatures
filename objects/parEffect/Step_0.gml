particleUpdate_counter += 60/room_speed

if (particleUpdate_counter > 0) {
    repeat (particleUpdate_counter)
		part_system_update(ps)    
	
    particleUpdate_counter = frac(particleUpdate_counter)
}