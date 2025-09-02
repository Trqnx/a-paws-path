extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var option_screen: Panel = $option_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_buttons.visible = true
	option_screen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_settings_pressed() -> void:
	print("Settings Pressed")
	main_buttons.visible = false
	option_screen.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_settings_pressed() -> void:
	_ready()
