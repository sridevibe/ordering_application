class Order < ActiveRecord::Base
	has_many :line_items
	enum state: [:placed, :waiting, :accepted]
	accepts_nested_attributes_for :line_items
end
