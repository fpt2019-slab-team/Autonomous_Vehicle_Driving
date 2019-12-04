#!/usr/bin/python3

import pickle

# instruction {
BEGIN       = 0
END         = 1
STRAIGHT    = 2
TURN_LEFT   = 3
TURN_RIGHT  = 4

def inst2str(inp):
    if   inp == BEGIN:
        return 'BEGIN'
    elif inp == END:
        return 'END'
    elif inp == STRAIGHT:
        return 'STRAIGHT'
    elif inp == TURN_LEFT:
        return 'TURN_LEFT'
    elif inp == TURN_RIGHT:
        return 'TURN_RIGHT'
# }

# map {
road_map = ''\
    '/-------------------\\\n'\
    '| 0       1       2 |\n'\
    '|   /----   ----\   |\n'\
    '|   |   |   |   |   |\n'\
    '|   |   |   |   |   |\n'\
    '|   |   |   |   |   |\n'\
    '|   -----   -----   |\n'\
    '| 3       4       5 |\n'\
    '|   -----   -----   |\n'\
    '|   |   |   |   |   |\n'\
    '|   |   |   |   |   |\n'\
    '|   |   |   |   |   |\n'\
    '|   \----   ----/   |\n'\
    '| 6       7       8 |\n'\
    '\-------------------/\n'\

ROAD_MAP = ''\
    ' y\\x  0   1   2   3   4 (x * 700)\n'\
    '     /-------------------\\\n'\
    '  0  |   i   i   i   i   |\n'\
    '     | - /----   ----\   |\n'\
    '  1  |   |   |   |   |   |\n'\
    '     | - |   |   |   |   |\n'\
    '  2  |   |   |   |   |   |\n'\
    '     | - -----   -----   |\n'\
    '  3  |         o         |\n'\
    '     | - -----   -----   |\n'\
    '  4  |   |   |   |   |   |\n'\
    '     | - |   |   |   |   |\n'\
    '  5  |   |   |   |   |   |\n'\
    '     | - \----   ----/   |\n'\
    '  6  |                   |\n'\
    '     \-------------------/\n'\
    ' (y * 700)\n'
# }

# lut {
road_lut = [
        [3, 0, 1, TURN_RIGHT ],
        [1, 0, 3, TURN_LEFT  ],

        [0, 1, 2, STRAIGHT   ],
        [0, 1, 4, TURN_RIGHT ],
        [2, 1, 0, STRAIGHT   ],
        [2, 1, 4, TURN_LEFT  ],
        [4, 1, 0, TURN_LEFT  ],
        [4, 1, 2, TURN_RIGHT ],

        [1, 2, 5, TURN_RIGHT ],
        [5, 2, 1, TURN_LEFT  ],

        [6, 3, 0, STRAIGHT   ],
        [6, 3, 4, TURN_RIGHT ],
        [0, 3, 6, STRAIGHT   ],
        [0, 3, 4, TURN_LEFT  ],
        [4, 3, 6, TURN_LEFT  ],
        [4, 3, 0, TURN_RIGHT ],

        [1, 4, 7, STRAIGHT   ],
        [1, 4, 5, TURN_LEFT  ],
        [1, 4, 3, TURN_RIGHT ],
        [3, 4, 5, STRAIGHT   ],
        [3, 4, 1, TURN_LEFT  ],
        [3, 4, 7, TURN_RIGHT ],
        [5, 4, 3, STRAIGHT   ],
        [5, 4, 7, TURN_LEFT  ],
        [5, 4, 1, TURN_RIGHT ],
        [7, 4, 1, STRAIGHT   ],
        [7, 4, 3, TURN_LEFT  ],
        [7, 4, 5, TURN_RIGHT ],

        [2, 5, 8, STRAIGHT   ],
        [2, 5, 4, TURN_RIGHT ],
        [8, 5, 2, STRAIGHT   ],
        [8, 5, 4, TURN_LEFT  ],
        [4, 5, 2, TURN_LEFT  ],
        [4, 5, 8, TURN_RIGHT ],

        [7, 6, 3, TURN_RIGHT ],
        [3, 6, 7, TURN_LEFT  ],

        [8, 7, 6, STRAIGHT   ],
        [8, 7, 4, TURN_RIGHT ],
        [6, 7, 8, STRAIGHT   ],
        [6, 7, 4, TURN_LEFT  ],
        [4, 7, 8, TURN_LEFT  ],
        [4, 7, 6, TURN_RIGHT ],

        [5, 8, 7, TURN_RIGHT ],
        [7, 8, 5, TURN_LEFT  ],
    ]
# }

#route = [7, 6, 3, 0, 1, 2, 5, 8, 7] 

def init_route():
    print('please input route number')
    route_number = list(input())
    print('->'.join(route_number))

    output_route = []
    for i in range(0,len(route_number)):
        y, x = (int(route_number[i]) // 3) * 3, (int(route_number[i]) % 3) * 2
        if i == 0:
            rt = [y, x,  BEGIN]
        else:
            yy = (int(route_number[i-1]) // 3) * 3
            xx = (int(route_number[i-1]) % 3) * 2
            if yy - y == 0:
                output_route.append([y, max(x, xx)-1, STRAIGHT])
            elif xx - x == 0:
                output_route.append([int(yy+(y-yy)/3), x, STRAIGHT])
                output_route.append([int(yy+(y-yy)*2/3), x, STRAIGHT])
    
            if i == len(route_number)-1:
                rt = [y, x, END]
            else:
                for lut in road_lut:
                    if int(route_number[i-1]) == lut[0] and \
                       int(route_number[i])   == lut[1] and \
                       int(route_number[i+1]) == lut[2]:
                        rt = [y, x, lut[3]]
        output_route.append(rt)
    return output_route

def printnavi(navi):
    for n in navi:
        print('[{}, {}, {:<10}]'.format(n[0], n[1], inst2str(n[2])))

print(road_map)
route = init_route()
print()
print(ROAD_MAP)
printnavi(route)

f = open('route.txt', 'wb')
pickle.dump(route, f)
f.close()
