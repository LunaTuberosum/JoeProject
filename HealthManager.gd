extends Node


@export var health_obj: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_healthManager(player_health: int, player_maxHealth: int):
	var x = 40
	for i in range(player_maxHealth / 2):
		var temp: Node = health_obj.instantiate()
		temp.position.x = x
		x += 24
		temp.position.y = 16
		add_child(temp)
		
	var health_count: int = 0
	var child_count: int = 0
	for i in range(player_health):
		health_count += 1
		if health_count == 1:
			get_child(child_count).setup("half")
		elif health_count == 2:
			get_child(child_count).setup("full")
			child_count += 1
			health_count = 0

func change_health(new_amount: int):
	for i in range(get_child_count()):
		get_child(i).setup("empty")
	
	var health_count: int = 0
	var child_count: int = 0
	for i in range(new_amount):
		health_count += 1
		if health_count == 1:
			get_child(child_count).setup("half")
		elif health_count == 2:
			get_child(child_count).setup("full")
			child_count += 1
			health_count = 0
