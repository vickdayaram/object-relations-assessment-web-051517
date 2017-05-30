class Restaurant

  attr_accessor :name


  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.find_by_name(name)
    @@all.each do |restaurant_object|
      if restaurant_object.name.downcase == name.downcase
        return restaurant_object
      end
    end
    Restaurant.new(name)
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.collect do |review|
      if review.restaurant.name.downcase == self.name.downcase
        review
      end
    end
  end

  def customers
    Review.all.collect do |review|
      if review.restaurant.name.downcase == self.name.downcase
        review.customer
      end
    end
  end

end
