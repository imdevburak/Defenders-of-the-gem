extends Used_on_self
class_name Equipment

@export_enum("Head", "Body", "Legs", "Hands", "Back", "On body", "On leg") var clothingSlot = "Head"

var equipped : bool = false

func use(player : Node2D):
	in_arm = false
	equipped = true
	self.reparent(player)

func take_off():
	equipped = false
	self.reparent(get_tree().current_scene)
