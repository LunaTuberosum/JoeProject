extends State
class_name Rolling

var positionToMove: Vector2 = Vector2.ZERO

func _init(player: AnimatedSprite2D):
	super(player, "rolling")

func run(delta):	
	if player.movePoint.position != positionToMove:
	
		if player.movePoint.position.x != player.position.x:
			var diffrence = player.movePoint.position.x - player.position.x
			
			if diffrence == 32: player.movePoint.position.x = player.position.x + 64
			elif diffrence == -32: player.movePoint.position.x = player.position.x - 64
			elif diffrence > 0: 
				if diffrence < 5: player.movePoint.position.x += 64
				else: player.movePoint.position.x += 32
			elif diffrence < 0: 
				if diffrence > -5: player.movePoint.position.x -= 64
				else: player.movePoint.position.x -= 32
			
		elif player.movePoint.position.y != player.position.y:
			var diffrence = player.movePoint.position.y - player.position.y
			
			if diffrence == 32: player.movePoint.position.y = player.position.y + 64
			elif diffrence == -32: player.movePoint.position.y = player.position.y - 64
			elif diffrence > 0: 
				if diffrence < 5: player.movePoint.position.y += 64
				else: player.movePoint.position.y += 32
			elif diffrence < 0: 
				if diffrence > -5: player.movePoint.position.y -= 64
				else: player.movePoint.position.y -= 32
			
		positionToMove = player.movePoint.position
	
	player.play("Rolling")
	player.position = lerp(player.position, player.movePoint.position, 25 * delta)
