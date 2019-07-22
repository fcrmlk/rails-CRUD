class Author < ApplicationRecord
	validates :name, :age, :city,  presence: true
	has_many :books
end