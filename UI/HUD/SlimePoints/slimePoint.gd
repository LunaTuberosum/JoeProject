extends Sprite2D

var states
var state

@export var state_images: Array[CompressedTexture2D]

func setup(state: String):
	states = {
		"full": 0,
		"empty": 1
	}
	change_state(state)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func change_state(new_state: String):
	state = states.get(new_state)
	texture = state_images[state]
