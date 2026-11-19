class_name Player
extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = 100.0
@export var axel: float = 1.0
@export var friction: float = 1.0
@export var current_item_in_hand: Used_items

func _process(delta: float) -> void:
	if current_item_in_hand:
		current_item_in_hand.global_position = $hand.global_position
