extends State
class_name Idle


func _init(player: AnimatedSprite2D):
	super(player, "idle")

func run(delta):
	player.play("Portrait")
