extends RigidBody2D
class_name Item

var in_arm : bool = false

func _ready() -> void:
	set_collision_layer_value(1,false)
	set_collision_mask_value(1,false)
	
	set_collision_layer_value(2,true)
	set_collision_mask_value(2,true)

func grab(Grab_node : Node2D):
	in_arm = true
	freeze = true
	self.reparent(Grab_node)
	global_position = Grab_node.global_position

func drop():
	in_arm = false
	freeze = false
