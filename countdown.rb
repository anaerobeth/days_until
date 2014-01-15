require 'csv'

class Araw
  attr_accessor :event, :month, :day, :day_now, :day_target

  def initialize(month, day, event)
    @month = month
    @day = day
    @event = event
    @day_now = Time.now.yday
    @day_target = Time.local(2014, month, day).yday
  end

  def count_day
    day_target - day_now
  end

  def display
    puts "#{count_day} days until #{month}/#{day} - #{event.to_s}"
  end
end

CSV.foreach("/Users/Tenorio/vermonster/exercises/deadlines.csv") do |row|
    if row == []
      puts "You have no deadlines. Yay!"
      break
    else
      month, day, event = row
      Araw.new(month, day, event).display
    end
end

