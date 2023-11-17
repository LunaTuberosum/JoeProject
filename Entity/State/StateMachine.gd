extends Node
class_name StateMachine

var states

func _init():
	states = {
		"idle": Idle,
		"walking": Walking,
		"running": Running,
		"rolling": Rolling
	}

func get_state(state_name: String) -> GDScript:
	if states.has(state_name):
		return states.get(state_name)
	else:
		return null
