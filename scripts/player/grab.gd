extends State

@export var inp_man: InputManager
@export var speed: float = 100
@export var axel: float = 0.5
@export var player: Player
@export var grab_range: Area2D 

func _update(delta: float) -> void:
	# Move the player based on the input
	
	
	
	for body in grab_range.get_overlapping_bodies():
		if body is RigidBody2D:
			player.current_item_in_hand = body.get_parent()
			player.current_item_in_hand.grab($"../../hand".global_position)
			change_state.emit("idle")
			break
	
	if player.current_item_in_hand:
		if !grab_range.get_overlapping_bodies():
			player.current_item_in_hand.drop()
			player.current_item_in_hand = null
			print("jaj")
			change_state.emit("idle")
	change_state.emit("idle")


func _debug() -> void:
	print("Bodies to pick up: ",grab_range.get_overlapping_bodies())
