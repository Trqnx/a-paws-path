extends Area2D

@onready var pickup: AudioStreamPlayer = $pickup

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

	
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		pickup.play()
		animated_sprite_2d.visible = false

func _on_pickup_finished() -> void:
	queue_free()
