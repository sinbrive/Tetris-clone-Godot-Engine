extends Node2D

onready var tile=preload("res://Tetris/Tile.tscn")
onready var shape=preload("res://Tetris/Tetromino.tscn")
onready var raycasts=preload("res://Tetris/Raycasts.tscn")
onready var tiles_2=preload("res://Tetris/Tiles_2.tscn")
onready var tiles_set=preload("res://Tetris/Tiles_2_set.tscn")

const GRID=32

var current_shape

var rot=0
var index=0

var lines

var inputs={
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT,
	'ui_down_timer': Vector2.DOWN
	}

func _ready():
	randomize()
	var i=randi() % global.tetros_set.size()
	index=i
	current_shape = get_shape(global.tetros_set[index], 0)
	$ShapeArea.add_child(current_shape)
	lines = tiles_set.instance()
	$ShapeArea.add_child(lines)
	$Timer.start()
	
	
func _physics_process(delta):
	pass


func get_shape(num, _rot):
	var coords=[]
	var s = shape.instance()
	var tetros= num[_rot]
	for coord in tetros:
		var b = tile.instance()
		b.modulate = global.colors[global.tetros_set.find(num, 0)]
		b.position=Vector2(coord.x*GRID, coord.y*GRID)  
		s.add_child(b)
		coords.append(Vector2(coord.x*GRID, coord.y*GRID))
	s.position=Vector2(GRID/2, GRID/2)  # centrered
	
	var ray = raycasts.instance()
	ray.get_node("left").position=coords[0]
	ray.get_node("right").position=coords[1]
	ray.get_node("up").position=coords[2]
	ray.get_node("down").position=coords[3]
	
	s.add_child(ray)

	return s
	
func is_overlapped_at_floor(): # not used
	pass

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	# rotation
	
	if dir=='ui_down':
		$fallTimer.wait_time=0.01
		$fallTimer.start()
		return
	
	if dir=='ui_up':
		if !can_rotate(current_shape, rot, index): 
			return
		rot += 1
		rot = rot%4
		var pos=current_shape.position
		$ShapeArea.remove_child(current_shape)
		current_shape.queue_free()
		current_shape=get_shape(global.tetros_set[index], rot)
		current_shape.position=pos
		$ShapeArea.add_child(current_shape)
		return
		
	var vect_pos=inputs[dir]*(GRID)  # next position delta
	
	for r in current_shape.get_node("Raycasts").get_children():
		r.cast_to=vect_pos/2
		r.add_exception(current_shape)
		r.force_raycast_update()

	for r in current_shape.get_node("Raycasts").get_children():
		if r.is_colliding():
			
			current_shape.position -= vect_pos
			if r.get_collider().name=='right' or r.get_collider().name=='left':
				break
				
			current_shape.position += vect_pos
			move_squares_to_static()
			
#			$ShapeArea.remove_child(current_shape) ## not to be done
			$fallTimer.stop()
			check_lines_full()
			
			var i=randi() % global.tetros_set.size()
			index=i
			current_shape = get_shape(global.tetros_set[i], 0)
			$ShapeArea.add_child(current_shape)
			return
			break
			
	current_shape.position += vect_pos
			

func can_rotate(sh, _rot, _index):  # by reference !
	var s = shape.instance()
	var r=_rot 
	r += 1
	r = r%4
	var pos=sh.position
	s=get_shape(global.tetros_set[_index], r)
	s.position=pos
	s.get_node("Raycasts").free()
	s.set_visible(false)
	$ShapeArea.add_child(s)
	for ch in s.get_children():
		if is_out_screen(ch):
			$ShapeArea.remove_child(s)
			s.queue_free()
			return false
	$ShapeArea.remove_child(s)
	s.queue_free()
	return true
	
func is_out_screen(ch):
	
	return (ch.global_position.x > 9.5*GRID or ch.global_position.x < 1.5*GRID or
				 ch.global_position.y < 1.5*GRID or  ch.global_position.y > 20.5*GRID )
	

func move_squares_to_static():
	for ch in current_shape.get_children():
		if ch.name == "Raycasts": 
			continue
		var b = tiles_2.instance()
		b.position=ch.position+current_shape.position
		b.modulate=ch.modulate
		lines.add_child(b)
			
	$ShapeArea.remove_child(current_shape)
	current_shape.queue_free()


func check_lines_full() -> void:
	var count = 0
	for i in range(lines.get_children().size()):
		var row = 21*GRID - i * GRID - GRID/2
		for item in lines.get_children():
			if item.global_position.y == row:
				count += 1
		if count == 0:
			break
		if count == 10:
			remove_line(row)
		count = 0
		

func remove_line(row):
	var updated_lines = []
	for ln in lines.get_children():
		if ln.global_position.y  == row:
			lines.remove_child(ln)
			ln.queue_free()
			
	for ln in lines.get_children():
		if ln.global_position.y  < row:
			ln.global_position.y += GRID


func _on_Timer_timeout():
	move('ui_down_timer')


func _on_nextShapeTimer_timeout():
	move('ui_down_timer')