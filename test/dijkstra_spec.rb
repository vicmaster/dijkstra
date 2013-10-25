require './dijkstra'

describe Dijkstra do

  it "return the shortest distance" do
    dijkstra = Dijkstra.new
    dijkstra.distance.should eq("short distance")
  end

end
