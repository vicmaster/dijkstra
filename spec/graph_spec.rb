require 'spec_helper'

describe Graph do
  it 'should return the creation of the arista' do
    graph = Graph.new
    node_a = Node.new('a')
    node_b = Node.new('b')

    graph.add_arista(node_a, node_b, 40)

    graph.children_of(node_a).should eq [node_b]
    graph.children_of(node_b).should eq [node_a]
    graph.nodes.should eq [node_a, node_b]
  end
end
