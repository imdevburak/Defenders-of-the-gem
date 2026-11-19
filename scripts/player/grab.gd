extends State

@export var inp_man: InputManager
@export var speed: float = 100
@export var axel: float = 0.5
@export var grab_man: PlayerGrabManager
@export var player: Player
@export var grab_range: Area2D 

func _update(delta: float) -> void:
	# Move the player based on the input
	
	if grab_man.current_item_in_hand: 
		grab_man.current_item_in_hand.drop()
		grab_man.current_item_in_hand = null
	
	if grab_range.get_overlapping_bodies():
		for body in grab_range.get_overlapping_bodies():
			if body is Used_items:
				if !body.in_arm:
					grab_man.current_item_in_hand = body
					grab_man.current_item_in_hand.grab($"../../hand")
					grab_man.current_item_in_hand.top_level = true
			break
	
	
	
	# Change state
	if !player.is_on_floor():
		change_state.emit("airborn")
	elif inp_man.jump_inp_pressed:
		change_state.emit("jump")
	else:
		change_state.emit("idle")
	


func _debug() -> void:
	print("Bodies to pick up: ",grab_range.get_overlapping_bodies())
