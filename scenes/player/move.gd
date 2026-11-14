extends State

@export var inp_man: InputManager
@export var speed: float = 100
@export var player: Player

func _update(delta: float) -> void:
	player.velocity = inp_man.direction * speed
	player.move_and_slide()
	# Change state
	if !player.is_on_floor():
		change_state.emit("airborn")
	print(player.velocity)
