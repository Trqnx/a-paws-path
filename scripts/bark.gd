extends AudioStreamPlayer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
var number = rng.randi_range(0,7500)

func _process(delta: float) -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	number = rng.randi_range(0,7500)
	while true:
		if number == 9:
			$".".play()
			break
		elif number != 9:
			break
 
