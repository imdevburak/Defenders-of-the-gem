extends Equipment
class_name  Temperature_protect_equipment

@export_range(-10, 0, 1) var coldTemperatureProtect : int
@export_range(0, 10, 1) var hotTemperatureProtect : int

func use(player : Node2D):
	super(player)
	# player.minT += coldTemperatureProtect
	# player.maxT += hotTemperatureProtect

func take_off():
	super()
	# player.minT -= coldTemperatureProtect
	# player.maxT -= hotTemperatureProtect
