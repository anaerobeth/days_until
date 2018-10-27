require 'csv'

class Tracker
  attr_accessor :event, :month, :day, :day_now, :day_target

  def initialize(month, day, event, year)
    @month = month
    @day = day
    @event = event
    @day_now = Time.now.yday
    @day_target = Time.local(year, month, day).yday
    @year = year.to_i
  end

  def count_day
    adjustment = if Date.leap?(@year)
      366 * (@year - Time.now.year)
    else
      365 * (@year - Time.now.year)
    end
    day_target - day_now + adjustment
  end

  def display
    days = count_day.to_s.rjust(3,' ')
    puts "#{days} days until #{month.to_s.rjust(2,' ')}/#{day.to_s.rjust(2,'0')} - #{event.to_s}"
  end
end

puts '---'
CSV.foreach("/Users/Tenorio/vermonster/days_until/deadlines.csv") do |row|
    if row == []
      puts "You have no deadlines. Yay!"
      break
    else
      month, day, event = row
      Araw.new(month, day, event).display
    end
end
puts '---'
