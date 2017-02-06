class Portfolio < ApplicationRecord
	has_many :technologies, dependent: :destroy
	accepts_nested_attributes_for :technologies, 
																allow_destroy: true,
																reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}
end


# DEFINED IN MODELS
#
# def self.mike
# => find(params[:id])
# end
#
# scope :mike, => { find(params[:id]) }
#
# -----------------------------------------
#
# USED IN VIEWS / COTROLLER
#
# @mike_scope = Portolio.find(params[:id])
# 
# @mike_scope = Portfolio.mike.
#
#
#
#
#
#