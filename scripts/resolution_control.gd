extends OptionButton

func _on_item_selected(index: int) -> void:
	var options = ["Yes", "No"]
	var choice = options[index]
	print(choice)
	if choice == "Yes":
		DisplayServer.VSyncMode.VSYNC_ENABLED
		print("V-sync enabled")
	elif choice == "No":
		DisplayServer.VSyncMode.VSYNC_DISABLED
		print("V-sync disabled")
