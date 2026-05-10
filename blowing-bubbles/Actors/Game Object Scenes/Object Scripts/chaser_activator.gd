extends Area2D

@export var linkedEnemy: StaticBody2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player detected")
		linkedEnemy.activated = true
