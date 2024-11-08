import 'dart:collection';

class Node<T> {
  int? id;
  Node(this.id);

  @override
  String toString() => '$id';
}

class Graph<T> {
  final Map<Node<T>, List<Node<T>>> adj;
  Graph(this.adj);

  void addEdge(Node<T> nodel1, Node<T> nodel2) {
    if (!adj.containsKey(nodel1)) adj[nodel1] = <Node<T>>[];
    if (!adj.containsKey(nodel2)) adj[nodel2] = <Node<T>>[];
    adj[nodel1]?.add(nodel2);
    adj[nodel2]?.add(nodel1);
  }

  List<Node<T>>? shorstPath(Node<T> soure, Node<T> dest) {
    final path = <Node<T>, Node<T>>{};
    final distance = <Node<T>, int>{};

    //adj.keys.forEach(( node) => distance[node]=-1);
    for (final node in adj.keys) {
      distance[node] = -1;
    }
    distance[soure] = 0;
    final q = Queue<Node<T>>();
    q.add(soure);
    while (q.isNotEmpty) {
      final node = q.removeFirst();
      for (final adjs in adj[node]!.where((n) => distance[n] == -1)) {
        distance[adjs] = distance[node]! + 1;
        path[adjs] = node;
        q.add(adjs);
      }
    }
    final res = <Node<T>>[];
    var cur = dest;
    while (cur != soure) {
      res.add(cur);
      cur = path[cur]!;
      //print(path);
    }
    res.add(soure);
    return res;
  }
}

void main(List<String> args) {
  final g = Graph<int>({});

  final n1 = Node<int>(1);
  final n2 = Node<int>(2);
  final n3 = Node<int>(3);
  final n4 = Node<int>(4);
  final n5 = Node<int>(5);
  final n6 = Node<int>(6);
  final n7 = Node<int>(7);
  g.addEdge(n1, n2);
  g.addEdge(n1, n3);
  g.addEdge(n1, n4);
  g.addEdge(n4, n5);
  g.addEdge(n2, n6);
  g.addEdge(n4, n7);
  g.addEdge(n5, n6);
  final asw = g.shorstPath(n7, n1);
  print(asw);
}



// class Solution {
//   Set<String> found = {};
//   Set<String> second_island_set = {};
//   Set<String> searched = {};
//   int shortestBridge(List<List<int>> grid) {
//     List<List<int>> first_island = [];
//     List<List<int>> second_island = [];
//     for (int i = 0; i < grid.length; ++i) {
//       for (int x = 0; x < grid[i].length; ++x) {
//         if (grid[i][x] == 1 &&
//             !(found.contains(i.toString() + " " + x.toString()))) {
//           if (first_island.length == 0) {
//             explore(grid, [i, x], first_island);
//           } else {
//             explore(grid, [i, x], second_island);
//             i = 10000000;
//             break;
//           }
//         }
//       }
//     }
//     List<List<int>> queue = [];
//     //Iterate through the first list to initialize the BFS queue.
//     for (int i = 0; i < first_island.length; ++i) {
//       queue.add(first_island[i]);
//     }
//     //Create map of second island for faster searching
//     for (int i = 0; i < second_island.length; ++i) {
//       second_island_set.add(second_island[i][0].toString() +" " + second_island[i][1].toString());
//     }

//     bool done = false;
//     int iteration = 0;

//     while (queue.length != 0 && done == false) {
//       int init_queue = queue.length;
//       for (int i = 0; i < init_queue; ++i) {
//         List<int> current = queue[i];
//         String curr_str = current[0].toString() + " " + current[1].toString();
//         if (searched.contains(curr_str)) {
//           continue;
//         }
//         searched.add(curr_str);
//         String current_str = current[0].toString() + " " + current[1].toString();
//         if (second_island_set
//             .contains(current[0].toString() + " " + current[1].toString())) {
//           done = true;
//           break;
//         }
//         if (current[0] > 0) {
//           queue.add([current[0] - 1, current[1]]);
//         }
//         if (current[1] > 0) {
//           queue.add([current[0], current[1] - 1]);
//         }
//         if (current[0] < grid.length - 1) {
//           queue.add([current[0] + 1, current[1]]);
//         }
//         if (current[1] < grid[current[0]].length - 1) {
//           queue.add([current[0], current[1] + 1]);
//         }
//       }
//       if (done != true) {
//         queue = queue.sublist(init_queue);
//         iteration += 1;
//       }
//     }
//     return iteration - 1;
//   }

//   //DFS to explore the entire island that is at the position[0][1]. This places the island positions in
//   //the inputted island matrix and adds the values to the found set to help not search the same island
//   //multiple times.
//   void explore(List<List<int>> grid, List<int> position, List<List<int>> island) {
//     int currentx = position[0];
//     int currenty = position[1];
//     if (grid[currentx][currenty] != 1) {
//       return;
//     }
//     String position_str = currentx.toString() + " " + currenty.toString();
//     if (found.contains(position_str)) {
//       return;
//     }
//     found.add(position_str);
//     island.add([currentx, currenty]);
//     if (currentx > 0) {
//       explore(grid, [currentx - 1, currenty], island);
//     }
//     if (currenty > 0) {
//       explore(grid, [currentx, currenty - 1], island);
//     }
//     if (currentx < grid.length - 1) {
//       explore(grid, [currentx + 1, currenty], island);
//     }
//     if (currenty < grid[currentx].length - 1) {
//       explore(grid, [currentx, currenty + 1], island);
//     }
//   }
// }

// void main(List<String> args) {
//   Solution solution = Solution();
//   solution
//   ..explore(, position, island);
// }
