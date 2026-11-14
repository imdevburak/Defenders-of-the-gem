extends Control

@export var GrayBox : PackedScene
@export var SettingsNode : Control

func _on_graybox_pressed() -> void:
	get_tree().change_scene_to_packed(GrayBox)


func _on_settings_pressed() -> void:
	SettingsNode.Show_hide()


func _on_quit_pressed() -> void:
	get_tree().quit()
