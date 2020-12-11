/// @param joint
/// @param owner
/// @param x
/// @param y
/// @param side
function joint_initiate(joint, owner, x, y, side) {
	with (joint) {
		id.owner = owner
	
	    id.side = side
	    id.joint = physics_joint_revolute_create(owner, id, x, y, 0, 0, 1, 0, 0, 0, 0)
	}
}
