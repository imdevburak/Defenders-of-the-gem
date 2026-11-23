class_name Player
extends CharacterBody2D

@export var speed: float = 100.0
@export var jump_velocity: float = 100.0
@export var axel: float = 1.0
@export var friction: float = 1.0

func _physics_process(delta: float) -> void:
	move_and_slide()
