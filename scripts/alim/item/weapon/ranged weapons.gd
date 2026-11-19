extends Used_items
class_name Ranged_weapons

@export var projectile : PackedScene
@export var throw_force : float = 800.0

var direction : Vector2 = Vector2.RIGHT

func use(object : Node2D):
	if ready_to_use and object and projectile:
		use_f(object)
		reload_to_use() # wear() уже вызывается внутри reload_to_use()

func use_f(object : Node2D):
	var ins = projectile.instantiate() as Throwing_weapons
	if not ins:
		push_warning("Снаряд в Ranged_weapons должен быть классом Throwing_weapons!")
		return
		
	var norm_dir = direction.normalized()
	ins.strength += strength
	
	# Добавляем стрелу в главную сцену и запускаем её
	get_tree().current_scene.add_child(ins)
	ins.launch(object.global_position, norm_dir, throw_force, object)

func set_dir(dir : Vector2):
	direction = dir
