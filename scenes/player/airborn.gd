extends State

@export var player: Player

func _update(delta: float) -> void:
	var gravity_vector = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
	player.velocity += gravity_vector * delta
	print(player.velocity)
	player.move_and_slide()
	
	if player.is_on_floor():
		change_state.emit("move")
