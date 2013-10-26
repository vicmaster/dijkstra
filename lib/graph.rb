# This class give the graph of the dijkstra algorithm
class Graph
  attr_reader :nodes, :weights

  def initialize(options = {})
    @nodes   = []
    @weights = {}
  end

  def add_arista(node, other_node, weight)
    add_weight_to_key_node(node, other_node, weight)

    add_weight_to_key_other_node(node, other_node, weight)

    @nodes << node unless @nodes.include?(node)
    @nodes << other_node unless @nodes.include?(other_node)
  end

  def add_weight_to_key_node(node, other_node, weight)
    if @weights.key?(node)
      @weights[node][other_node] = weight
    else
      @weights[node] = { other_node => weight }
    end
  end

  def add_weight_to_key_other_node(node, other_node, weight)
    if @weights.key?(other_node)
      @weights[other_node][node] = weight
    else
      @weights[other_node] = { node => weight }
    end
  end

  def children_of(node)
    @weights[node].keys
  end

  def shortest_path(origin_node, destination_node)
    dijkstra = Dijkstra.new(self)
    dijkstra.shortest_path(origin_node, destination_node)
  end
end
