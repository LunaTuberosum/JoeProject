extends State
class_name Running


func _init(player: AnimatedSprite2D):
	super(player, "running")

func run(delta):
	player.play("Portrait")
	player.position = lerp(player.position, player.movePoint.position, 25 * delta)
