require 'rspec/autorun'
require_relative './check_number'

describe CheckNumber do
	context "when checking an integer" do
		let(:checker) { CheckNumber.new }

		it "return 7 when checking number 16" do
			expect(checker.sum_digits(16)).to eql(7)
		end
	end
end
