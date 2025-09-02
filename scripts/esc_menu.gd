extends Control

@onready var esc_menu: Control = $"."
@onready var main_buttons: VBoxContainer = $PanelContainer/Control/MainButtons
@onready var option_screen: Panel = $PanelContainer/Control/option_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_buttons.visible = true
	option_screen.visible = false
	esc_menu.visible = false




func resume():
	get_tree().paused = false
func pause():
	get_tree().paused = true

func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		esc_menu.visible = true
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		main_buttons.visible = true
		option_screen.visible = false
		esc_menu.visible = false
		resume()

func _on_start_pressed() -> void:
	resume()
	esc_menu.visible = false


func _on_settings_pressed() -> void:
	print("Settings Pressed")
	main_buttons.visible = false
	option_screen.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main_buttons.visible = true
	option_screen.visible = false
	esc_menu.visible = true

func _on_reset_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()
