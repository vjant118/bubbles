extends PanelContainer

const LEVEL = preload("res://UI/levelSelect.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL)
