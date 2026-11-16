extends Used_items
class_name Throwing_weapons

var direction : Vector2
@export var throw_force : float = 500.0 # Вынесли силу броска в переменную

func use(object : Node2D):
	if ready_to_use and object:
		use_f(object)
		reload_to_use()
		wear()

func use_f(object : Node2D):
	# Создаем копию оружия для броска
	var projectile = self.duplicate() 
	
	# Задаем начальную позицию (например, позицию того, кто бросает)
	projectile.global_position = object.global_position
	
	# Добавляем копию в главную сцену
	get_tree().current_scene.add_child(projectile)
	
	# Применяем импульс ОДИН РАЗ при броске
	projectile.apply_central_impulse(direction.normalized() * throw_force)

func set_dir(dir : Vector2):
	direction = dir
