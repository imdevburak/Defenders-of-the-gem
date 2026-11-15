extends State

@export var player: Player
@onready var jump_velocity: float = player.jump_velocity

func _enter() -> void:
	player.velocity.y = abs(player.velocity.y) - jump_velocity
	player.move_and_slide()

func _update(delta: float) -> void:
	if !player.is_on_floor(): change_state.emit("airborn")
	else: change_state.emit("idle")
