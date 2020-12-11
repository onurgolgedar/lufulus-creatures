event_inherited()

var petlight = instance_create_layer(objPlayer.x, objPlayer.y, "lyAbovePlayer", objPetlig)
petlight.target = objPlayer.id

update_character()