#!/usr/bin/python3
import matplotlib.pyplot as plt
from line import *

def main():
    np.seterr(divide='raise')

    lines = np.array([
        [[9, 0], [1, 5]],
        [[4, 1], [9, 4]],
        [[8, 2], [9, 1]],
        [[9, 3], [0, 4]],
        [[6, 4], [0, 3]],
    ])
    num = 30
    lines = np.random.rand(num * 2 * 2).reshape(num, 2, 2) * 10

    while True:
        vs = np.random.rand(4 * 2).reshape(4, 2) * 10
        edges = np.array([
            (vs[0], vs[1]),
            (vs[1], vs[2]),
            (vs[2], vs[3]),
            (vs[3], vs[0]),
        ])
        ns = np.array([line2n(edge) for edge in edges])
        #thetas = np.abs(np.arccos([ns[i] @ ns[(i + 1) % 4] for i in range(len(ns))]))
        thetas = np.abs(np.arccos([ns[i - 1] @ ns[i] for i in range(len(ns))]))
        if np.min(thetas) < pi / 4:
            continue
        theta = np.sum(thetas)
        if abs(theta - 2 * pi) > 0.00001:
            continue
        norms = np.array([np.linalg.norm(edge[1] - edge[0]) for edge in edges])
        if np.any(norms < 3):
            continue
        norm = np.sum(norms)
        if norm < 10:
            continue
        break


    plt.xlabel('x')
    plt.ylabel('y')
    plt.xticks(np.arange(10))
    plt.yticks(np.arange(10))
    plt.grid()
    #plt.legend()
    #plt.gca().invert_yaxis()

    plt.gca().set_aspect('equal', 'datalim')
    for line in lines:
        plt.plot(line[0,0], line[0,1], 'o', markersize=10)
        plt.plot(line[:,0], line[:,1], zorder=1, lw=5, c='black')
        line = shrink_line(line, edges)
        if line is not None:
            plt.plot(line[0,0], line[0,1], 'o', markersize=10)
            plt.plot(line[:,0], line[:,1], zorder=9, lw=2, c='yellow')

    for i in range(len(edges)):
        plt.plot(edges[i][:, 0], edges[i][:, 1], label=str(i))

    plt.savefig('a.png')
    #plt.show()

if __name__ == '__main__':
    main()

