require './node'

describe Node do

  it "should return a node created" do
    node = Node.new('a')
    node.name.should eq('a')
  end

  it "should return comparisions into different nodes" do
    node_a = Node.new('a')
    node_b = Node.new('b')
    node_a.name.should_not eq node_b.name
  end

  it "should return comparisions into same node" do
    node_1 = Node.new('a')
    node_2 = Node.new('a')
    node_1.name.should eq node_2.name
  end
end
