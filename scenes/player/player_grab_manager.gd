class_name PlayerItemManager
extends Node

@export var hand: Marker2D
var current_item_in_hand: Item

func _process(delta: float) -> void:
	if !current_item_in_hand: return
	current_item_in_hand.global_position = hand.global_position
