extends Used_items
class_name Throwing_weapons

var direction : Vector2 = Vector2.RIGHT
@export var throw_force : float = 500.0

func use(object : Node2D):
	if ready_to_use and object:
		use_f(object)
		reload_to_use() # wear() уже внутри reload_to_use(), второй раз не пишем

func use_f(object : Node2D):
	# Если сцена загружена из файла, создаем чистый экземпляр всего предмета (Node2D + RigidBody)
	if scene_file_path != "":
		var ins = load(scene_file_path).instantiate() as Throwing_weapons
		ins.strength = strength # Передаем текущий урон
		get_tree().current_scene.add_child(ins)
		ins.launch(object.global_position, direction.normalized(), throw_force, object)

# Универсальный метод запуска для броска рукой и выстрела из лука
func launch(start_pos: Vector2, norm_dir: Vector2, force: float, shooter: Node2D):
	in_arm = false
	if RigidBody:
		RigidBody.freeze = false # Обязательно размораживаем тело!
		RigidBody.global_position = start_pos + norm_dir * 15.0 # Небольшой отступ от стрелка
		RigidBody.rotation = norm_dir.angle()
		
		if shooter is PhysicsBody2D:
			RigidBody.add_collision_exception_with(shooter)
			
		RigidBody.apply_central_impulse(norm_dir * force)

func set_dir(dir : Vector2):
	direction = dir
