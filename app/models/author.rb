class Author < ApplicationRecord
	validates :name, :age, :city,  presence: true
end