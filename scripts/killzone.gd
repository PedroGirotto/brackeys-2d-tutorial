extends Area2D


@onready var timer: Timer = $Timer
@onready var death_sfx: AudioStreamPlayer2D = $DeathSFX


func _on_body_entered(body: Node2D) -> void:
	timer.start()
	death_sfx.play()
	Engine.time_scale = 0.55
	body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
