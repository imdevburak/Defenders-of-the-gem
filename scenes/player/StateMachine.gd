class_name StateMachine
extends Node

@export var current_state: State

var states: Dictionary = {}

func _ready() -> void:
	current_state._enter()
	current_state.change_state.connect(_on_change_state)
	for state in get_children():
		if state is State:
			states.set(state.name.to_lower(), state)

func _process(delta: float) -> void:
	current_state._update(delta)

func _on_change_state(new_state: String) -> void:
	current_state._exit()
	current_state = states.get(new_state.to_lower())
	current_state._enter()
	current_state.change_state.connect(_on_change_state)
