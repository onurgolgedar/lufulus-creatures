if (global.selectedTarget != pointer_null and global.selectedTarget != id)
	with (global.selectedTarget)
	{
		ttarget = other.id
		ai_reaction(ttarget)
	}