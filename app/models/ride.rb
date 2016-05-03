class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !enough_tickets && !tall_enough
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_user
    end 
  end

  def update_user
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def tall_enough
    user.height >= attraction.min_height
  end

  def enough_tickets
    user.tickets >= attraction.tickets
  end

end
