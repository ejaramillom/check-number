require 'rspec/autorun'
require_relative './check_number'

RSpec.configure do |config| # a config file would handle this inside the framework to separate the responsibility from the spec file
	config.formatter = :documentation
end

describe CheckNumber do
	context "when checking an integer" do
		let(:checker) { CheckNumber.new } # this has to be refactored to use FactorybBot instances instead

		it "return 7 when checking number 16" do
			expect(checker.sum_digits(16)).to eql(7)
		end

		it "return 9 when checking number 99999" do
			expect(checker.sum_digits(99999)).to eql(9)
		end
	end

	context "when checking a string" do # additional contexts would allow for a wider set of testing for the implementation
		let(:checker) { CheckNumber.new }

		it "return a message indicating the attribute is not an integer" do
			expect(checker.sum_digits('thing')).to eq(nil)
		end
	end

	context "when checking a boolean" do
		let(:checker) { CheckNumber.new }

		it "return a message indicating the attribute is not a boolean" do
			expect(checker.sum_digits(true)).to eq(nil)
		end
	end

	context "when no number is input" do
		let(:checker) { CheckNumber.new }

		it "return zero as default value for input" do
			expect(checker.sum_digits).to eq(0)
		end
	end
end

# additional tests for edge cases need to be addressed
