extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.4
	body.get_node("CollisionShape2D").queue_free()	# 碰到怪物就下坠，因为去除了碰撞盒
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
