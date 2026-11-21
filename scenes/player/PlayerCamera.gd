extends Camera2D

@export var zoom_value: float = 0.03

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom *= 1 + zoom_value
				# call the zoom function
			# zoom out
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom *= 1 - zoom_value
				# call the zoom function
