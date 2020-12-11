event_inherited()
name = eng() ? "Material" : "Materyal"
/*description = eng() ? ("An amount of materials provide\n[c="+string(c_aqua)+"]100% upgrading chance[/c].")
: ("Bir miktar materyal kullanarak\naynı kategorideki eşyayı [c="+string(c_aqua)+"]kesin olarak[/c]\ngeliştirebilirsin.")*/
description = ""/*eng() ? ("You need this to upgrade an item.")
: ("Bir eşya geliştirmek için buna\nihtiyacın olacak.")*/
name_base = name

worth = 0
itemLevel = 1
upgrade = -1

type = type_material

isCollectable = true

image_speed = 0

alarm[0] = 1