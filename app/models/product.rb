class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true # Ensures every element has an entry
	validates :price, numericality: {greater_than_or_equal_to: 0.01} # Positive price only
	validates :title, uniqueness: true # Is unique in database
	validates :image_url, allow_blank: true, format: { # Control formats
		with:
		%r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
end
