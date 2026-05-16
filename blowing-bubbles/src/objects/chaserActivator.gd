extends Area2D

@export var linkedEnemies: Array[StaticBody2D] = []

func _on_body_entered(body):
	if body.is_in_group("player"):
		for enemy in linkedEnemies:
			if enemy:
				enemy.activated = true
