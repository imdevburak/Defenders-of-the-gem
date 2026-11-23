extends Used_items
class_name Ranged_weapons

@export var projectile : PackedScene
@export var throw_force : float = 800.0

func use(object : Node2D):
	if ready_to_use and object and projectile:
		use_f(object)
		reload_to_use() # wear() уже вызывается внутри reload_to_use()

func use_f(object : Node2D):
	var ins = projectile.instantiate() as Throwing_weapons
	if not ins:
		push_warning("Снаряд в Ranged_weapons должен быть классом Throwing_weapons!")
		return
		
	var direction = self.global_position.direction_to(get_global_mouse_position())
	ins.strength += strength
	
	# Добавляем стрелу в главную сцену и запускаем её
	get_tree().current_scene.add_child(ins)
	ins.launch(object.global_position, direction, throw_force, object)
