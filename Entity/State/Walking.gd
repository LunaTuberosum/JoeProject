extends State
class_name Walking


func _init(entity: Area2D):
	super(entity, "walking")

func run(delta):
	entity.get_child(0).play("Moving")
	entity.get_child(0).flip_h = entity.facing == 0
	entity.position = entity.position.move_toward(entity.movePoint.position, 150 * delta)
