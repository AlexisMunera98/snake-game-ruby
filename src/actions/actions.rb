module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end

  def self.change_direction(state, direction)
    if next_direction_is_valid?(state, direction)

    end
  end

  private

  def self.move_snake_to(state, position)
    new_positions = [position] + state.snake.positions[0...-1]
    state.snake.positions = new_positions
    state
  end

  def self.position_is_valid?(state, position)
    is_invalid = ((position.row >= state.grid.rows || position.row.negative?) ||
        (position.col >= state.grid.cols || position.col.negative?))

    return false if is_invalid
    return !(state.snake.positions.include? position)
  end

  def self.calc_next_position(state)
    current_position = state.snake.positions.first
    case state.next_direction
    when Model::Direction::UP
      Model::Coord.new(current_position.row - 1, current_position.col)
    when Model::Direction::RIGHT
      Model::Coord.new(current_position.row, current_position.col + 1)
    when Model::Direction::DOWN
      Model::Coord.new(current_position.row + 1, current_position.col)
    when Model::Direction::LEFT
      Model::Coord.new(current_position.row, current_position.col - 1)
    else
      current_position
    end
  end

  def self.next_direction_is_valid?(state, direction)
    
  end

  def self.end_game(state)
    state.game_finished = true
    state
  end

end
