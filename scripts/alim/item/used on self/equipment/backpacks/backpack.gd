extends Equipment
class_name Backpack

@export var slotsPositions : Array[Marker2D]
@export var filter : Array[StringName]

var slotsFree : int

func _ready() -> void:
	if not slotsPositions.is_empty():
		slotsFree = slotsPositions.size() - 1

func use(player : Player):
	super(player)
	# player.backpack = self

func take_off():
	super()
	# player.backpack = self

func add_to_slot(object : Item):
	if not filter.is_empty():
		if not object.name in filter:
			return
	for slot in slotsPositions:
		if slot.get_child_count() == 0:
			object.reparent(slot)
			object.position = Vector2.ZERO

func take_off_slot(object : Item):
	if object.get_parent() in slotsPositions:
		object.reparent(get_tree().current_scene)
		object.drop()
