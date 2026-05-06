extends Node

func _on_again_pressed() -> void:
	get_tree().reload_current_scene()
	
func _on_level_pressed() -> void:
	get_tree().change_scene_to_file('res://UI/level_select.tscn')
