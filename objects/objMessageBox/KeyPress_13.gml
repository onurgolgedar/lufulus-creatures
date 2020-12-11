if (front) {
    if (owner != -1) {
		with (owner) {
			other.answer = other.buttonNo[0]
			give_answer(other.answer, other.qKey)
		}
    }
        
    destroy = true
    alarm[2] = 1
}