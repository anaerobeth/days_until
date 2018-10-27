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

if File.file?('deadlines.csv')
  File.open('deadlines-bak.csv', 'w') do |line|
    CSV.foreach(File.open('deadlines.csv')) do |row|
      if row == []
        puts "You have no deadlines. Yay!"
      else
        month, day, event, year = row
        if year.nil?
          year = Time.now.year
        end
        tracker = Tracker.new(month, day, event, year)
        tracker.display

        if tracker.count_day >= 0
          line.puts row.join(',')
        end
      end
    end
  end
  puts '---'
  puts 'Remove all past deadlines? Enter y/n:'
  response = gets.chomp
  if response == 'y'
    begin
      File.delete('deadlines.csv')
      File.rename('deadlines-bak.csv', 'deadlines.csv')
      puts 'Past deadlines have been removed from your records'
    rescue
      puts 'Your current deadlines are saved'
      File.rename('deadlines-bak.csv', 'deadlines.csv')
    end
  else
    puts 'No changes were made to your deadlines'
  end
else
  puts 'You don\'t have anything recorded yet'
  puts 'To start logging your deadlines, type something like:'
  puts '$ echo "3,9,launch app" >> deadlines.csv'
  puts 'To log a deadline for a date next year:'
  puts '$ echo "1,1,write new year\'s resolution,2019" >> deadlines.csv'
  puts 'Then run the ruby script again'
end


