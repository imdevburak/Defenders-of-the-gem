extends State

@export var item_man: PlayerItemManager
@export var player: Player

func _enter() -> void:
	if item_man.current_item_in_hand:
		if item_man.current_item_in_hand is Equipment:
			item_man.current_item_in_hand.use(player)


func _update(delta: float) -> void:
	change_state.emit("idle")

func _debug() -> void:
	print("using")
