extends State

@export var player: Player
@export var friction: float = 0.01
@export var inp_man: InputManager

func _update(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, 0.0, friction)
	player.move_and_slide()
	
	if player.is_on_floor() and inp_man.direction.x != 0.0:
		change_state.emit("move")
	elif inp_man.jump_inp_pressed:
		change_state.emit("jump")
	elif Input.is_action_just_pressed("grab&drop"):
		change_state.emit("grab")
