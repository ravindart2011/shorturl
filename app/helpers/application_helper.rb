module ApplicationHelper
  def get_top_countries(ary)
    h = Hash.new(0)
    arr = ary.each { |v| h[v] += 1 }
    h.sort_by {|k,v| -v }&.to_h&.keys&.first(3)&.join(", ")
  end
end
