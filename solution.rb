# Please copy/paste all three classes into this file to submit your solution!

class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(full_name)
    first_last = full_name.split(" ")
    @@all.find do |customer|
      customer.first_name.downcase == first_last[0].downcase && customer.last_name.downcase == first_last[1].downcase
    end
  end

  def self.find_all_by_first_name(first_name)
    @@all.select do |customer|
      customer.first_name.downcase == first_name.downcase
    end
  end

  def self.all_names
    @@all.collect do |customer|
      customer.first_name + " " + customer.last_name
    end
  end

  def add_review(restaurant, content)
    new_restaurant = Restaurant.find_by_name(restaurant)
    new_review = Review.new(new_restaurant, content, self)
  end
end


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
