extends State
class_name Walking


func _init(player: AnimatedSprite2D):
	super(player, "walking")

func run(delta):
	player.play("Portrait")
	player.position = lerp(player.position, player.movePoint.position, 15 * delta)
