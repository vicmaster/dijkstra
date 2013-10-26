# This class execute dijkstra algorithm
class Dijkstra
  def initialize(graph)
    @graph = graph
  end

  def infinity
    1.0 / 0
  end

  def shortest_path(origin_node, destination_node)
    final_action = destination_node
    nodes = [final_action]

    apply_dijkstra(origin_node)

    while final_action != -1
      final_action = @previous[final_action]
      nodes.unshift(final_action) if final_action != -1
    end

    Path.new(nodes, @distances[destination_node])
  end

  def check_all_nodes(origin_node, distances, previous)
    all_nodes = @graph.nodes.compact

    while all_nodes.any?
      closest_node = nil
      all_nodes.each do |node|
        comparison = closest_node && distances[node] < distances[closest_node]
        closest_node = node if closest_node.nil? || comparison
      end

      return if distances[closest_node] == infinity
      all_nodes.delete(closest_node)

      children_of_closest_node(closest_node, distances, previous)
    end
  end

  def children_of_closest_node(closest_node, distances, previous)
    @graph.children_of(closest_node).each do |node|
      distance = distances[closest_node] + @graph.weights[closest_node][node]
      if distance < distances[node]
        distances[node] = distance
        previous[node] = closest_node
      end
    end
  end

  def set_nodes(origin_node, distances, previous)
    @graph.nodes.each do |node|
      distances[node] = infinity
      previous[node] = -1
    end

    distances[origin_node] = 0
    check_all_nodes(origin_node, distances, previous)
  end

  def apply_dijkstra(origin_node)
    @distances    = {}
    @previous = {}

    set_nodes(origin_node, @distances, @previous)
  end
end
