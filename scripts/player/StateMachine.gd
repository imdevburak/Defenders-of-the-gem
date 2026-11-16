class_name StateMachine
extends State

@export var current_state: State
## If true _debug() function will run right after _update()
@export var debug: bool = false
var states: Dictionary = {}

func _ready() -> void:
	current_state._enter()
	current_state.change_state.connect(_on_change_state)
	for state in get_children():
		if state is State:
			states.set(state.name.to_lower(), state)

func _process(delta: float) -> void:
	current_state._update(delta)
	if debug and Input.is_action_pressed("debug print"):
		print("-- Debug --")
		print("State machine name: ", self.name)
		print("Current state: ", current_state.name)
		print("-- State debug --")
		current_state._debug()

func _on_change_state(new_state: String) -> void:
	var previous_state = current_state
	current_state._exit()
	current_state = states.get(new_state.to_lower())
	current_state._enter()
	
	previous_state.change_state.disconnect(_on_change_state)
	current_state.change_state.connect(_on_change_state)
