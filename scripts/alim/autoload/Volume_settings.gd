extends Node

var OverallVolume = 0
var MusicVolume = 0
var EffectsVolume = 0

func set_OverallVolume(i : float):
	OverallVolume = linear_to_db(i)

func set_MusicVolume(i : float):
	MusicVolume = linear_to_db(i)

func set_EffectsVolume(i : float):
	EffectsVolume = linear_to_db(i)

func get_OverallVolume() -> float:
	return OverallVolume

func get_MusicVolume() -> float:
	return MusicVolume

func get_EffectsVolume() -> float:
	return EffectsVolume
