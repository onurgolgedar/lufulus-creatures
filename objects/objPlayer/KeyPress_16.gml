shiftLock_window = false

with (objItemBag) {
    event_perform(ev_other, ev_user1)
    event_perform(ev_other, ev_user2)
    if (mouseOnBody) {
        if (mouseOnBox)
			other.shiftLock_window = true
    }
}

with (objTradeWindow) {
    event_perform(ev_other, ev_user1)
    event_perform(ev_other, ev_user2)
    if (mouseOnBody) {
        if (mouseOnBox)
			other.shiftLock_window = true
    }
}

with (objBankWindow) {
    event_perform(ev_other, ev_user1)
    event_perform(ev_other, ev_user2)
    if (mouseOnBody) {
        if (mouseOnBox)
			other.shiftLock_window = true
    }
}