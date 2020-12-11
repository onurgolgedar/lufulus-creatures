event_inherited()

rigidbody_destroy()
ds_list_destroy(windows)

if (tLight != pointer_null) {
	instance_destroy(tLight)
	tLight = pointer_null
}
	
if (tFire != pointer_null) {
	instance_destroy(tFire)
	tFire = pointer_null
}