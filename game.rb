require './lib/lottery'

def play_lotto
  puts 'Enter a number between 1 and 6'
  matching_numbers = gets.to_i
  until matching_numbers.between?(1, 6)
    puts 'Invalid number. Please enter a number between 1 and 6.'
    matching_numbers = gets.to_i
  end
  puts 'Loop how many times?'
  loops = gets.to_i
  until matching_numbers.between?(1, 100000)
    puts 'Invalid number. Please enter a number between 1 and 100000.'
    loops = gets.to_i
  end
  ticket = Ticket.new
  lottery = Lottery.new
  ticket.lucky_dip
  puts 'Your ticket numbers:'
  print "\n"
  print ticket.numbers
  print "\n"
  print "\n"
  average = []
  loops.times do |i|
    while lottery.matches.length < matching_numbers
      lottery.pick_winning_numbers
      lottery.check_matching_numbers(ticket.numbers)
      lottery.itr += 1
    end
    average[i] = lottery.itr
    puts "Loop #{i + 1}. Number of iterations: #{lottery.itr}"
    puts "Cost: £#{lottery.itr * 2}"
    print "\n"
    puts 'Matches:'
    print lottery.matches
    print "\n"
    print "\n"
    lottery.itr = 1
    lottery.matches = []
  end
  puts "Average iterations: #{average.sum / average.length}"
  puts "Average cost: £#{(average.sum / average.length) * 2}"
  puts "Lowest iterations: #{average.min}"
  puts "Lowest cost: £#{average.min * 2}"
  puts "Highest iterations: #{average.max}"
  puts "Highest cost: £#{average.max * 2}"
end

play_lotto
