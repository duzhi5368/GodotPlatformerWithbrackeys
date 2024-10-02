extends Node2D

@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 30
var direction = 1 # 反向使用-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isColliding():
		direction *= -1
	flipEnemy(direction)
	position.x += (direction * SPEED * delta)


func isColliding() -> bool:
	if ray_cast_2d_left.is_colliding():
		return true
	if ray_cast_2d_right.is_colliding():
		return true
	return false
		
func flipEnemy(enemyDirection: int) ->void:
	if enemyDirection == -1:
		animated_sprite_2d.flip_h = true
	elif enemyDirection == 1:
		animated_sprite_2d.flip_h = false
