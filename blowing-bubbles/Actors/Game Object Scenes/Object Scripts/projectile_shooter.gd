extends Node2D

@export var projectile: PackedScene
@export var shootSpeed: int = 2
@export var fireRate: float = 3.0
@export var startDelay: float = 0.0

func _ready():
	if startDelay > 0:
		await get_tree().create_timer(startDelay).timeout
	$Timer.wait_time = fireRate
	$Timer.start()

func _on_timer_timeout():
	shoot()
	
func shoot():
	var bullet = projectile.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = global_position
	var direction = Vector2.RIGHT.rotated(global_rotation)
	bullet.apply_central_impulse(direction * shootSpeed * -100)
