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
	if Input.is_action_pressed("debug print"): debug = !debug
	if debug :
		print("-- Debug --")
		print("State machine name: ", self.name)
		print("Current state: ", current_state.name)
		print("-- State debug --")
		current_state._debug()

func _on_change_state(new_state: String) -> void:
	if !states.has(new_state.to_lower()): 
		push_error("No state by the name: ", new_state)
		return
	var previous_state = current_state
	current_state._exit()
	current_state = states.get(new_state.to_lower())
	current_state._enter()
	
	previous_state.change_state.disconnect(_on_change_state)
	current_state.change_state.connect(_on_change_state)
