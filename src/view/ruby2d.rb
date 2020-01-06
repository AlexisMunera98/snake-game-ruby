# frozen_string_literal: true

require 'ruby2d'
module View
  class Ruby2dView
    def initialize
      @pixel_size = 50
    end

    def start(state)
      extend Ruby2D::DSL
      set(title: 'Snake',
          width: @pixel_size * state.grid.cols,
          height: @pixel_size * state.grid.rows
      )
      show
    end

    def render(state)
      render_snake(state)
      render_food(state)
    end

    private

    def render_snake(state)
      @snake_positions&.each(&:remove)
      extend Ruby2D::DSL
      snake = state.snake
      @snake_positions = snake.positions.map do |pos|
        Square.new(x: pos.col * @pixel_size, y: pos.row * @pixel_size, size: @pixel_size, color: "green")
      end
    end

    def render_food(state)
      @food&.remove
      extend Ruby2D::DSL
      food = state.food
      @food = Square.new(x: food.col * @pixel_size, y: food.row * @pixel_size, size: @pixel_size, color: "yellow")

    end
  end
end