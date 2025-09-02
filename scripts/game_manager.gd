extends Node

@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"

func _ready() -> void:
	audio_stream_player.play()



func _on_killzone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		audio_stream_player.stop()
