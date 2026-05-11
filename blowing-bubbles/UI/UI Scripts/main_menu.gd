extends PanelContainer

const LEVEL = preload("res://UI/UI Scenes/level_select.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL)
