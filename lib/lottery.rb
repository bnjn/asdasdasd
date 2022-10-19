class Ticket
  attr_reader :numbers

  def initialize
    @pointer = 0
    @numbers = Array.new(6)
  end

  def lucky_dip
    pick = rand(1..59)
    lucky_dip if @numbers.include?(pick)
    @numbers[@pointer] = pick
    @pointer += 1
    lucky_dip if @pointer != @numbers.length
    @pointer = 0
  end

  def pick_numbers
    if @pointer == @numbers.length
      @pointer = 0
    else
      puts 'Pick 6 numbers between 1-59' if @pointer.zero?
      puts "Pick number #{@pointer + 1}:"
      input = gets.to_i
      if input.between?(1, 59)
        @numbers[@pointer] = input
        @pointer += 1
      elsif @pointer != 0
        puts 'Pick a number between 1-59'
      end
      pick_numbers
    end
  end
end

class Lottery
  attr_accessor :itr, :matches

  def initialize
    @pointer = 0
    @winning_numbers = []
    @matches = []
    @itr = 1
  end

  def pick_winning_numbers
    @matches = []
    pick = rand(1..59)
    pick_winning_numbers if @winning_numbers.include?(pick)
    @winning_numbers[@pointer] = pick
    @pointer += 1
    pick_winning_numbers if @pointer != 6
    @pointer = 0
  end

  def check_matching_numbers(ticket)
    if @pointer == ticket.length
      @pointer = 0
    else
      @matches.push(ticket[@pointer]) if @winning_numbers.include?(ticket[@pointer])
      @pointer += 1
      check_matching_numbers(ticket)
    end
  end
end
