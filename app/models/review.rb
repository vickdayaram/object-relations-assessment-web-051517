class Review

  @@all = []

  attr_reader :restaurant, :customer, :content

  def initialize(restaurant, content, customer)
    @restaurant = restaurant
    @content = content
    @customer = customer
    @@all << self
  end

  def self.all
    @@all
  end


end
