extends Area2D


@onready var game_manager: Node = %GameManager
@onready var sound: AudioStreamPlayer2D = $PickupSFX


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	sound.play()
	visible = false
	$CollisionShape2D.queue_free()


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
