extends Control

func Show_hide():
	visible = !visible


func volume_changed(value: float) -> void:
	VolumeSettings.set_OverallVolume(value)


func music_volume_changed(value: float) -> void:
	VolumeSettings.set_MusicVolume(value)


func effect_volume_changed(value: float) -> void:
	VolumeSettings.set_EffectsVolume(value)
