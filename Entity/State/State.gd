extends Node
class_name State


var entity: Area2D
var state_name: String

# Template for a state

func _init(entity: Area2D, state_name: String):
	self.entity = entity
	self.state_name = state_name

func run(delta):
	pass
