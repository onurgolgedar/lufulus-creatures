if (isMassiveArrow)
	sprite_index = sprMassiveArrow
else if (isGlacialArrow)
	sprite_index = sprGlacialArrow
	
fromPlayer = instance_exists(owner) and owner.object_index == objPlayer