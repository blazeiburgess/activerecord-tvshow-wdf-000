class Show < ActiveRecord::Base
  def self.highest_rating
    Show.all.map {|show| show.rating}.max 
  end
  def self.most_popular_show
    Show.find_by({:rating => highest_rating})
  end
  def self.lowest_rating
    Show.all.map {|show| show.rating}.min
  end
  def self.least_popular_show
    Show.find_by({:rating => lowest_rating})
  end
  def self.ratings_sum
    Show.all.map {|show| show.rating}.reduce(:+) 
  end
  def self.popular_shows
    # Show.all.select {|show| show.rating > 5}
    Show.where("rating > 5")
  end
  def self.shows_by_alphabetical_order
    Show.order("name")
  end
end
