extends State

@export var inp_man: InputManager
@export var speed: float = 100
@export var axel: float = 0.5
@export var grab_man: PlayerItemManager
@export var player: Player
@export var grab_range: Area2D 
@export var hold_ui: TextureProgressBar
var dropped_item: Used_items
@export var hold_timer: Timer

var t := 0.0
func _enter() -> void:
	hold_timer.start(0.1)
	t = 0.0

func _update(delta: float) -> void:
	var direction := Input.get_axis("left","right")
	player.velocity.x = lerpf(player.velocity.x, direction * 10, 0.5)
	
	if grab_range.get_overlapping_bodies() and !grab_man.current_item_in_hand:
	
		for body in grab_range.get_overlapping_bodies():
			if !(body is Used_items): break
			# проверка на то чтобы не подбирать предмет который только что выбросил
			if body == dropped_item: break
			
			grab_man.current_item_in_hand = body
			grab_man.current_item_in_hand.grab($"../../hand")
			grab_man.current_item_in_hand.top_level = true
			break
	
	t += delta * 3
	if Input.is_action_pressed("grab&drop"):
		hold_ui.value = abs(cos(t)) * hold_ui.max_value
	
	if Input.is_action_just_released("grab&drop"):
		# Throw item if the hold timer didn't go off
		if grab_man.current_item_in_hand and hold_timer.time_left == 0.0: 
			grab_man.current_item_in_hand.drop()
			var throw_vector := Vector2(player.velocity.x * (hold_ui.max_value - hold_ui.value),-2 * (hold_ui.max_value - hold_ui.value))
			grab_man.current_item_in_hand.set_axis_velocity(throw_vector)
			dropped_item = grab_man.current_item_in_hand
			grab_man.current_item_in_hand = null
		
		# Change state
		if !player.is_on_floor():
			change_state.emit("airborn")
		elif inp_man.jump_inp_pressed:
			change_state.emit("jump")
		else:
			change_state.emit("idle")

func _exit() -> void:
	dropped_item = null


func _debug() -> void:
	print("Bodies to pick up: ",grab_range.get_overlapping_bodies())
	print("hold timer time left:", hold_timer.time_left)
