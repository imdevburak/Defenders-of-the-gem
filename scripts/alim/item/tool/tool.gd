extends Used_items
class_name Tool

@export_enum("axe","pickaxe") var type

func use(object : Node2D):
	super(object)

func use_f(object : Node2D):
	if object is Extracted_object:
		var ext_object : Extracted_object = object
		
		if ext_object.right_type == type:
			ext_object.extract(strength)
	elif object is Enemy:
		var enemy_object : Enemy = object
		enemy_object.get_damage(strength)
