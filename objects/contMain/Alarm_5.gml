event_perform(ev_other, ev_user0)

var timePassed = global.gameTime-gameTime_start
change_hours(min(floor((timePassed > 6 ? 1 : 0)+(timePassed div 10)*0.10+(timePassed div 20)*0.24+(timePassed div 50)*0.45+(timePassed div 100)*0.94), 23))

gameTime_start = 0

room_goto(targetRoom)
global.locationName = targetRoomName

save_location(global.saveNo)