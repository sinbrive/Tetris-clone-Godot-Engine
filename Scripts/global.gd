extends Node

## see tetros_set and colors arrays at the end of this file

class Point:
	var x
	var y
	func _init(_x, _y):
		x=_x
		y=_y

var t_L = [
  [
	Point.new(0,0),
	Point.new(0,1),
	Point.new(0,2),
	Point.new(1,2)
  ],

  [
	Point.new(0,1), 
	Point.new(1,1),  
	Point.new(2,0),  
	Point.new(2,1) 
  ],

  [
	Point.new(0,0), 
	Point.new(1,0),
	Point.new(1,1),
	Point.new(1,2) 
  ],

   [
	Point.new(0,0), 
	Point.new(0,1), 
	Point.new(1,0), 
	Point.new(2,0)
   ]
]


var t_I = [
	  [
		Point.new(0,0), 
		Point.new(1,0), 
		Point.new(2,0), 
		Point.new(3,0)
	  ],
	  [
		Point.new(0,0), 
		Point.new(0,1),  
		Point.new(0,2), 
		Point.new(0,3), 
		
	  ],
	   [
		Point.new(0,0), 
		Point.new(1,0),  
		Point.new(2,0),
		Point.new(3,0)  
	  ],
	  [
		Point.new(0,0), 
		Point.new(0,1), 
		Point.new(0,2), 
		Point.new(0,3) 
	  ]
  ]

var t_O = [
	  [
		Point.new(0,0), 
		Point.new(0,1), 
		Point.new(1,0), 
		Point.new(1,1)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1), 
		Point.new(1,0),
		Point.new(1,1) 
	  ],
	  [
		Point.new(0,0), 
		Point.new(0,1),
		Point.new(1,0),
		Point.new(1,1) 
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1), 
		Point.new(1,0), 
		Point.new(1,1) 
	  ]
  ]


var t_T = [
	  [
		Point.new(0,0),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,0)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1),
		Point.new(0,2),
		Point.new(1,1)
	  ],
	  [
		Point.new(0,1),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,1)
	  ],
	  [
		Point.new(0,1),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(1,2)
	  ]
  ]
  

var t_J = [
	  [
		Point.new(0,2),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(1,2)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1),
		Point.new(1,1),
		Point.new(2,1)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1),
		Point.new(0,2),
		Point.new(1,0) 
	  ],
	  [
		Point.new(0,0),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(1,2)
	  ]
  ]

var t_S = [
	  [
		Point.new(0,1),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,0)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1),
		Point.new(1,1),
		Point.new(1,2)
	  ],
	  [
		Point.new(0,1),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,0)
	  ],
	  [
		Point.new(0,0),
		Point.new(0,1),
		Point.new(1,1),
		Point.new(1,2)
	  ]
  ]

var t_Z = [
	  [
		Point.new(0,0),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,1)
	  ],
	  [
		Point.new(0,1),
		Point.new(0,2),
		Point.new(1,0), 
		Point.new(1,1)
	  ],
	  [
		Point.new(0,0),
		Point.new(1,0),  
		Point.new(1,1),
		Point.new(2,1)
	  ],
	  [
		Point.new(0,1),
		Point.new(0,2),
		Point.new(1,0),  
		Point.new(1,1)
	  ]
  ]

var tetros_set=[t_I, t_J, t_L, t_O, t_S, t_T, t_Z]


var colors=[Color.cyan, Color.blue,Color.orange,Color.yellow,  
								Color.green,Color.purple, Color.red] 

