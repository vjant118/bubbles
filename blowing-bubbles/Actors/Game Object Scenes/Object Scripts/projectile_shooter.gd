extends Node2D

@export var projectile: PackedScene

func _on_timer_timeout():
	shoot()
	
func shoot():
	var bullet = projectile.instantiate()
	
