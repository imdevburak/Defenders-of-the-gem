extends Used_items
class_name Melee_weapons

func use_f(object : Node2D):
	if object is Enemy:
		object.get_damage(strength)
