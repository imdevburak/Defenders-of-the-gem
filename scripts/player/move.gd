extends State

@export var player: Player
@export var inp_man: InputManager
@onready var speed: float = player.speed
@onready var axel: float = player.axel


func _update(delta: float) -> void:
	# Move the player based on the input
	player.velocity.x = lerp(player.velocity.x, inp_man.direction.x * speed, axel)
	player.move_and_slide()
	
	# Change state
	if !player.is_on_floor():
		change_state.emit("airborn")
	elif inp_man.direction.x == 0.0:
		change_state.emit("idle")
	elif inp_man.jump_inp_pressed:
		change_state.emit("jump")
	elif Input.is_action_just_pressed("grab"):
		change_state.emit("grab")
