require 'csv'

class Araw
  attr_accessor :month, :day, :day_now, :day_target

  def initialize(month, day)
    @month = month
    @day = day
    @day_now = Time.now.yday
    @day_target = Time.local(2014, month, day).yday
  end

  def count_day
    day_target - day_now
  end

  def display
    puts "#{count_day} days until #{month}/#{day}"
  end
end

CSV.foreach("/Users/Tenorio/vermonster/exercises/deadlines.csv") do |row|
  month, day = row
  print Araw.new(month, day).display
end

