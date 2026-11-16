extends Used_items
class_name Ranged_weapons

@export var projectile : PackedScene
@export var throw_force : float = 800.0 # Для лука скорость обычно выше

var direction : Vector2

func use(object : Node2D):
	if ready_to_use and object and projectile:
		use_f(object)
		reload_to_use()
		wear()

func use_f(object : Node2D):
	var ins = projectile.instantiate()
	var norm_dir = direction.normalized()
	
	ins.global_position = object.global_position + norm_dir
	ins.rotation = norm_dir.angle()
	
	# Добавляем стрелу в главную сцену
	get_tree().current_scene.add_child(ins)
	
	# Применяем импульс к созданной стреле (ins), а не к шаблону (projectile)
	ins.add_collision_exception_with(object)
	ins.apply_central_impulse(norm_dir * throw_force)

func set_dir(dir : Vector2):
	direction = dir
