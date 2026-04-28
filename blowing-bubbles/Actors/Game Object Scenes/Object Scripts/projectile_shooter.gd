extends Node2D

@export var projectile: PackedScene
@export var shootSpeed: int
@export var fireRate: float

func _ready():
	$Timer.wait_time = fireRate
	$Timer.start()

func _on_timer_timeout():
	print("Timeout")
	shoot()
	
func shoot():
	var bullet = projectile.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = global_position
	var direction = Vector2.RIGHT.rotated(global_rotation)
	bullet.apply_central_impulse(direction * shootSpeed * -100)
	print("Projectile shot")
