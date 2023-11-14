extends Node
class_name State


var player: AnimatedSprite2D
var state_name: String

# Template for a state

func _init(player: AnimatedSprite2D, state_name: String):
	self.player = player
	self.state_name = state_name

func run(delta):
	pass
