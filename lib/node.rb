class Node
  attr_reader :data
  attr_accessor :left_child, :right_child

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

  def node_info
    puts '  ----------------------------'
    if @data.nil?
      puts ' No node exists'
    else
      left = @left_child.nil? ? 'nil' : @left_child.data
      right = @right_child.nil? ? 'nil' : @right_child.data
      puts "            Data: #{@data}"
      puts "   left : #{left}   ||  right : #{right}"
      puts ''
    end
  end

  def to_i
    return @data.to_i
  end

  def to_s
    return @data.to_s
  end
end
