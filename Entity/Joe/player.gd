extends Area2D

var maxHealth: float = 15
var health: float = 15

var maxSPoints: int = 2
var sPoints: int = 2

var stateMachine: StateMachine
var state: State 

var speed: int = 100
var direction: Vector2
var rollDelay: bool = false
var movePoint: Marker2D
var facing: int = 1
var LEFT_FACING: int = 0
var RIGHT_FACNG: int = 1

signal health_change

# Called when the node enters the scene tree for the first time.
func _ready():
	stateMachine = $StateMachine
	change_state("idle")
	
	movePoint = $MovePoint
	movePoint.position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if position.distance_to(movePoint.position) <= .05 and state.state_name != "rolling":
		position = movePoint.position
		
		direction = Vector2.ZERO
		
		if Input.is_action_pressed("move_left"):
			change_position("x", -32)
			facing = LEFT_FACING
		elif Input.is_action_pressed("move_right"):
			change_position("x", 32)
			facing = RIGHT_FACNG
		elif Input.is_action_pressed("move_down"):
			change_position("y", 32)
		elif Input.is_action_pressed("move_up"):
			change_position("y", -32)
			
		movePoint.position += direction
		
	if position != movePoint.position:
		if state.state_name != "rolling":
			
			if Input.is_action_pressed("run"):
				change_state('running')
			else:
				change_state('walking')
				
			if Input.is_action_just_pressed("roll") and rollDelay == false:
				change_state('rolling')
				$RollTimer.start()
				rollDelay = true
	else: 
		change_state("idle")
		
	state.run(delta)

	
	#DEbug
	
	if Input.is_action_just_pressed("debug1"):
		change_health(1)
		health_change.emit()
	if Input.is_action_just_pressed("debug2"):
		change_health(-1)
		health_change.emit()
	
func change_position(directionAxis: String, value: int) -> void:
	var newValue = value
	
	if Input.is_action_pressed("run"):
		newValue = (value * 2)
	
	if directionAxis == "x": direction.x += newValue
	if directionAxis == "y": direction.y += newValue
	
func change_health(amount: int):
	health += amount
	if health > maxHealth: health = maxHealth
	elif health < 0: health = 0
	
func change_state(state_name: String):
	
	if state == null:
		state = stateMachine.get_state(state_name).new(self)
		return
		
	if state.state_name != state_name:
		state = stateMachine.get_state(state_name).new(self)

func _on_roll_timer_timeout():
	change_state("idle")
	rollDelay = false
	
func _on_area_entered(area: Area2D):
	print(area.name)
