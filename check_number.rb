require 'rspec/autorun'

class CheckNumber
	def sum_digits(number = 0)
		return puts "You input something that is not an integer" unless number.is_a? Integer

		print_partial_sum(number)
		calculate_digits_sum(number)
	end

	private

	def print_partial_sum(number)
		puts "step sum of digits: #{number&.digits&.sum}"
	end

	def calculate_digits_sum(number)
		number&.digits&.sum > 10 ? sum_digits(number.digits.sum) : number&.digits&.sum
	end
end

CheckNumber.new.sum_digits(165532)
CheckNumber.new.sum_digits(987)
CheckNumber.new.sum_digits(9495968372)
CheckNumber.new.sum_digits
CheckNumber.new.sum_digits('thing')
CheckNumber.new.sum_digits(true)
CheckNumber.new.sum_digits({a: 'thing', ['b', 'c', 'd'] => 4 })

describe