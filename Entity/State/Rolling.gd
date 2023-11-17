extends State
class_name Rolling

var positionToMove: Vector2 = Vector2.ZERO

func _init(entity: Area2D):
	super(entity, "rolling")

func run(delta):	
	if entity.movePoint.position != positionToMove:
	
		if entity.movePoint.position.x != entity.position.x:
			var diffrence = entity.movePoint.position.x - entity.position.x
			
			if diffrence == 32: entity.movePoint.position.x = entity.position.x + 64
			elif diffrence == -32: entity.movePoint.position.x = entity.position.x - 64
			elif diffrence > 0: 
				if diffrence < 5: entity.movePoint.position.x += 64
				else: entity.movePoint.position.x += 32
			elif diffrence < 0: 
				if diffrence > -5: entity.movePoint.position.x -= 64
				else: entity.movePoint.position.x -= 32
			
		elif entity.movePoint.position.y != entity.position.y:
			var diffrence = entity.movePoint.position.y - entity.position.y
			
			if diffrence == 32: entity.movePoint.position.y = entity.position.y + 64
			elif diffrence == -32: entity.movePoint.position.y = entity.position.y - 64
			elif diffrence > 0: 
				if diffrence < 5: entity.movePoint.position.y += 64
				else: entity.movePoint.position.y += 32
			elif diffrence < 0: 
				if diffrence > -5: entity.movePoint.position.y -= 64
				else: entity.movePoint.position.y -= 32
			
		positionToMove = entity.movePoint.position
	
	entity.get_child(0).flip_h = entity.facing == 0
	entity.get_child(0).play("Rolling")
	entity.position = lerp(entity.position, entity.movePoint.position, 25 * delta)
