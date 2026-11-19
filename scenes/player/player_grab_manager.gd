class_name PlayerGrabManager
extends Node

@export var hand: Marker2D
var current_item_in_hand: Used_items

func _process(delta: float) -> void:
	if !current_item_in_hand: return
	current_item_in_hand.global_position = hand.global_position
