extends Node2D
class_name Item

@export var RigidBody : RigidBody2D
var in_arm : bool = false

func _ready() -> void:
	RigidBody.set_collision_layer_value(1,false)
	RigidBody.set_collision_mask_value(1,false)
	
	RigidBody.set_collision_layer_value(2,true)
	RigidBody.set_collision_mask_value(2,true)

func grab(Grab_point_position : Vector2):
	in_arm = true
	RigidBody.freeze = true
	RigidBody.global_position = Grab_point_position

func drop():
	in_arm = false
	RigidBody.freeze = false
