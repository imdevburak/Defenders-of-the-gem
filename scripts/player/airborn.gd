extends State

@export var player: Player

func _update(delta: float) -> void:
	var gravity_vector = ProjectSettings.get_setting("physics/2d/default_gravity")
	player.velocity.y += gravity_vector * delta
	if Input.is_action_just_released("jump") and player.velocity.y < 0.0:
		player.velocity.y /= 2
	player.move_and_slide()
	
	if player.is_on_floor():
		if player.velocity.x == 0.0:
			change_state.emit("idle")
		else:
			change_state.emit("move")
	elif Input.is_action_just_pressed("grab&drop"):
		change_state.emit("grab")
