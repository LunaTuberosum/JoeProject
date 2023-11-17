extends Area2D
class_name Enemy

var maxHealth: float = 15
var health: float = 15

var stateMachine: StateMachine
var state: State 

var speed: int = 150
var direction: Vector2
var movePoint: Marker2D
var facing: int = 1
var LEFT_FACING: int = 0
var RIGHT_FACNG: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	stateMachine = $StateMachine
	change_state("idle")
	
	movePoint = $MovePoint
	movePoint.position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_distance(position, movePoint.position) <= .05:
		position = movePoint.position
		
		if $DecisionTimer.is_stopped():
			$DecisionTimer.start()
			
	if position != movePoint.position:
		change_state('walking')
	else: 
		change_state("idle")
		
	state.run(delta)

	
func get_distance(position1, position2) -> float:
	return sqrt(pow((position1.x - position2.x), 2) + pow((position1.y - position2.y), 2))
	
func change_state(state_name: String):
	
	if state == null:
		state = stateMachine.get_state(state_name).new(self)
		return
		
	if state.state_name != state_name:
		state = stateMachine.get_state(state_name).new(self)


func _on_decision_timer_timeout():
	var ranDir = randi_range(1, 5)
		
	match ranDir:
		1:
			movePoint.position.x -= 32
			facing = LEFT_FACING
		2:
			movePoint.position.x += 32
			facing = RIGHT_FACNG
		3:
			movePoint.position.y += 32
		4:
			movePoint.position.y -= 32	
		_:
			pass
