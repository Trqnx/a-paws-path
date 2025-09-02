extends CanvasLayer

var bones_collected = 0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $AnimationPlayer/Timer
@onready var you_died: Label = $ColorRect/you_died
@onready var game_over_music: AudioStreamPlayer = $ColorRect/game_over_music

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score_count.text = "Bones = " + str(bones_collected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_bone_body_entered(body: Node2D) -> void:
	bones_collected = bones_collected + 1
	$score_count.text = "Bones = " + str(bones_collected)
func fade_to_black() -> void:
		animation_player.play("fade_to_black")
		timer.start()
		await timer.timeout
		$ColorRect.visible = true
		await animation_player.animation_finished
func fade_from_black() -> void:
	animation_player.play("fade_from_black")
	await animation_player.animation_finished


func _on_killzone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		you_died.text = "You Died"
		fade_to_black()
		game_over_music.play()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	you_died.visible = true
	$ColorRect/respawn_button.visible = true


func _on_respawn_button_pressed() -> void:
	get_tree().reload_current_scene()
