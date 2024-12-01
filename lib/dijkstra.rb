# frozen_string_literal: true

class Dijkstra
  def initialize(g)
    @graph = g
  end

  def find_shortest_path
    start = @graph.start
    goal = @graph.goal
    no_of_nodes = @graph.n * @graph.n
    # puts "starting with #{start}"
    @distance = { start => 0 }
    @prev = { start => nil }
    @known = Set.new([start])
    @active = Set.new([start])

    loop_count = 1
    loop do
      # puts "I know about #{@known.length} nodes.  will know look at all possible next steps from #{@active.length} nodes"
      min_distance = Float::INFINITY
      best_next_node = nil
      prev_to_best_next_node = nil

      @active.each do |known_node|
        # puts "  debugging neighbors: #{known_node} (#{@graph.n}) => #{@graph.neighbors(known_node)}"
        @graph.neighbors(known_node).each do |next_node|
          # puts "  from #{known_node} I cango to #{next_node}"
          if @known.include?(next_node)
            # puts "    it is known"
            # skip
          else
            cost = @graph.cost(known_node, next_node)
            this_distance = @distance[known_node] + cost
            if this_distance < min_distance
              # puts "    new node #{known_node} (#{@distance[known_node]}) -> #{next_node} (#{cost})"
              min_distance = this_distance
              best_next_node = next_node
              prev_to_best_next_node = known_node
            end
          end
        end # each next_node
      end # each known_node

      if best_next_node.nil?
        puts 'found nothing new, the end.'
        break
      end

      # puts "found the next best step: to #{best_next_node} gives distance #{min_distance}"

      @known.add(best_next_node)
      @active.add(best_next_node)
      @distance[best_next_node] = min_distance
      @prev[best_next_node] = prev_to_best_next_node

      break if best_next_node == goal

      # puts "I know about #{@known.length} nodes.   #{@active.length} active nodes."

      a = @active.to_a.dup
      a.each do |known_node|
        # puts "  debugging neighbors: #{known_node} (#{@graph.n}) => #{@graph.neighbors(known_node)}"
        if Set.new(@graph.neighbors(known_node)) <= @known
          # puts "All my neighbors are known - remove #{known_node} from @active"
          @active.delete(known_node)
        end
      end
      # puts "I know about #{@known.length} nodes.   #{@active.length} active nodes."

      if (loop_count % 500).zero?
        puts "  Loop #{loop_count}: #{(@known.length * 1.0 / no_of_nodes).round(2)}% known. #{@active.length} active."
      end
      loop_count += 1
    end

    dist = @distance[@graph.goal]
    puts "I know everything about #{@known.length} nodes, distance to the goal #{@graph.goal} is #{dist}"

    dist
  end
end
