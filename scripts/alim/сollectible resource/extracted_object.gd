extends Node2D
class_name Extracted_object

@export_enum("axe","pickaxe") var right_type
@export var endurance : int = 5
@export var loot : Array[Item]

func _ready() -> void:
	pass

func extract(effectiveness : int):
	endurance -= effectiveness
	if endurance <= 0:
		destruction()

func destruction():
	throw_loot()
	queue_free()

func throw_loot():
	if loot:
		for i : Item in loot:
			i.global_position = Vector2(global_position.x + randf_range(-10,10),global_position.y)
			get_parent().add_child(i)
