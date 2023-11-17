extends State
class_name Idle


func _init(entity: Area2D):
	super(entity, "idle")

func run(delta):
	entity.get_child(0).play("Portrait")
