extends Equipment
class_name Armor

@export_range(1, 15, 1) var protected : int

func use(player : Node2D):
	super(player)
	# player.protect += protected

func take_off():
	super()
	# player.protect -= protected
