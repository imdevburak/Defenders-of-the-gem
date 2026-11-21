extends State

@export var item_man: PlayerItemManager

func _enter() -> void:
	if item_man.current_item_in_hand:
		return
		#item_man.current_item_in_hand.

func _exit() -> void:
	pass

func _debug() -> void:
	print("(no debug values)")
