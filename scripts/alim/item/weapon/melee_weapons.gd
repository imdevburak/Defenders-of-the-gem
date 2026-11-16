extends Used_items
class_name Melee_weapons

func use_f(object : Node2D):
	var enemy : Enemy = object
	
	enemy.get_damage(strength)
