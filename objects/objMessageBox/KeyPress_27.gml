if ((front or specialDesign and instance_exists(owner) and object_get_parent(owner) == parWindow and owner.front) and dialogueID == -1 and !instance_exists(objMap)) {
    destroy = true
    alarm[2] = 1
}