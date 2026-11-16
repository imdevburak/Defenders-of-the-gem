class_name InputManager
extends Node

var direction: Vector2 = Vector2.ZERO
var jump_inp_pressed: bool = false
var grab_inp_pressed: bool = false

func _physics_process(delta: float) -> void:
	direction.x = Input.get_axis("left", "right")
	jump_inp_pressed = Input.is_action_just_pressed("jump")
	grab_inp_pressed = Input.is_action_just_pressed("grab")
