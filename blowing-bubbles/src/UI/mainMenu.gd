extends PanelContainer

const LEVEL = preload("res://UI/levelSelect.tscn")
func _ready() -> void:
	print("Is savedata Nil? ", savedata == null)

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL)
