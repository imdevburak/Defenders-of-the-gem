extends State

@export var inp_man: InputManager
@export var speed: float = 100
@export var axel: float = 0.5
@export var player: Player
@export var grab_range: Area2D 

func _update(delta: float) -> void:
	# Move the player based on the input
	
	if grab_range.get_overlapping_bodies():
		for body in grab_range.get_overlapping_bodies():
			if body is RigidBody2D:
				_pick_up(body)
	else:
		player.velocity.x = lerp(player.velocity.x, inp_man.direction.x * speed, axel)
		player.move_and_slide()
		
		# Change state
		if !player.is_on_floor():
			change_state.emit("airborn")
		elif inp_man.jump_inp_pressed:
			change_state.emit("jump")
		else:
			change_state.emit("idle")
		

func _pick_up(body: RigidBody2D) -> void:
	# should add somthing like this then merging body.pickup.emit(GrabObjectTargetPosition)
	pass

func _debug() -> void:
	print("Bodies to pick up: ",grab_range.get_overlapping_bodies())
