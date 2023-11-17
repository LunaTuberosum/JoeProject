extends State
class_name Running


func _init(entity: Area2D):
	super(entity, "running")

func run(delta):
	entity.get_child(0).play("Moving")
	entity.get_child(0).flip_h = entity.facing == 0
	entity.position = entity.position.move_toward(entity.movePoint.position, 225 * delta)
