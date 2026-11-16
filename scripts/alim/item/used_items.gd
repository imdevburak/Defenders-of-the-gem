extends Item
class_name Used_items

@export var usage : int = 1
@export var strength : int = 1
@export var rate : float = 1.0

var ready_to_use : bool = true

@warning_ignore("unused_parameter")
func use(object : Node2D):
	if ready_to_use and object:
		use_f(object)
		reload_to_use()

@warning_ignore("unused_parameter")
func attack(enemy : Enemy, dir : Vector2):
	if ready_to_use and enemy:
		use_f(enemy)
		reload_to_use()

@warning_ignore("unused_parameter")
func use_f(object : Node2D):
	pass

func wear():
	usage -= 1
	if usage <= 0:
		destruction()

func destruction():
	get_parent().drop()
	queue_free()

func reload_to_use():
	ready_to_use = false
	wear()
	await get_tree().create_timer(rate).timeout
	ready_to_use = true
