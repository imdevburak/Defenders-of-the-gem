extends Used_items
class_name Throwing_weapons

@export var throw_force : float = 500.0

func use(object : Node2D):
	if ready_to_use and object:
		use_f(object)
		reload_to_use()

func use_f(object : Node2D):
	# Если сцена загружена из файла, создаем чистый экземпляр всего предмета (Node2D + RigidBody)
	if scene_file_path != "":
		var ins = load(scene_file_path).instantiate() as Throwing_weapons
		ins.strength = strength # Передаем текущий урон
		get_tree().current_scene.add_child(ins)
		var direction : Vector2	 = self.global_position.direction_to(get_global_mouse_position())
		ins.launch(object.global_position, direction, throw_force, object)

# Универсальный метод запуска для броска рукой и выстрела из лука
func launch(start_pos: Vector2, norm_dir: Vector2, force: float, shooter: Node2D):
	in_arm = false
	freeze = false # Обязательно размораживаем тело!
	global_position = start_pos + norm_dir * 15.0 # Небольшой отступ от стрелка
	rotation = norm_dir.angle()
		
	if shooter is PhysicsBody2D:
		add_collision_exception_with(shooter)
		
		apply_central_impulse(norm_dir * force)

func _on_body_entered(body: Node) -> void:
	if body.has_method("get_damage"):
		body.get_damage(strength)
