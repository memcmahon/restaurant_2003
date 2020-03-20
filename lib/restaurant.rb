class Restaurant
  attr_reader :opening_time,
              :name,
              :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours)
    (@opening_time.to_i + hours).to_s + ':00'
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    @opening_time.to_i < 12
  end

  def menu_dish_names
    @dishes.map do |dish|
      dish.upcase
    end
    # @dishes.map { |dish| dish.upcase }

    # @dishes.map(&:upcase)
  end

  def announce_closing_time(hours)
    if closing_time(hours).to_i > 12
      clock_time = (closing_time(hours).to_i - 12).to_s + ":00PM"
    else
      clock_time = closing_time(hours) + "AM"
    end
    "#{@name} will be closing at #{clock_time}"
  end
end
