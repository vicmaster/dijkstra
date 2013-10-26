require 'spec_helper'

describe Dijkstra do

  it 'should return the shortest distance' do
    graph = Graph.new
    node_initial = Node.new('node_initial')
    node_2 = Node.new('node_2')
    node_3 = Node.new('node_3')
    node_4 = Node.new('node_4')
    node_6 = Node.new('node_6')
    final_node = Node.new('final_node aka node_5')

    # Initial node
    graph.add_arista(node_initial, node_2, 7)
    graph.add_arista(node_initial, node_3, 9)
    graph.add_arista(node_initial, node_6, 14)

    # Second node
    graph.add_arista(node_2, node_initial, 7)
    graph.add_arista(node_2, node_3, 10)
    graph.add_arista(node_2, node_4, 15)

    # Third node
    graph.add_arista(node_3, node_initial, 9)
    graph.add_arista(node_3, node_2, 10)
    graph.add_arista(node_3, node_4, 11)
    graph.add_arista(node_3, node_6, 2)

    # Fourth node
    graph.add_arista(node_4, node_2, 10)
    graph.add_arista(node_4, node_3, 11)
    graph.add_arista(node_4, final_node, 2)

    # Sixth node
    graph.add_arista(node_6, node_initial, 14)
    graph.add_arista(node_6, node_3, 2)
    graph.add_arista(node_6, final_node, 9)

    # Final node
    graph.add_arista(final_node, node_4, 6)
    graph.add_arista(final_node, node_6, 9)

    path = graph.shortest_path(node_initial, final_node)
    [node_initial, node_3, node_6, final_node].should eq path.nodes
    20.should eq path.distance
  end
end
