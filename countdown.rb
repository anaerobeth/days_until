require 'csv'

class Araw
  attr_accessor :event, :month, :day, :day_now, :day_target

  def initialize(month, day, event, year=2014)
    @month = month
    @day = day
    @event = event
    @year = year
    @day_now = Time.now.yday
    @day_target = Time.local(year, month, day).yday
  end

  def count_day
    day_target - day_now
  end

  def display
    puts "#{count_day.to_s.rjust(3,' ')} days until #{month.to_s.rjust(2,' ')}/#{day.to_s.rjust(2,'0')} - #{event.to_s}"
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
