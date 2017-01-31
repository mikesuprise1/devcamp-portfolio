class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
	layout 'portfolio'
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
	
	def index
		@portfolio_items = Portfolio.by_position
	end

	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end

		render nothing: true
	end

	def angular
		@angular_portfolio_items = Portfolio.angular
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully created." }
			else
				format.html { render :new }
			end
		end
	end

	def show
	end

	def edit
	end

	def update
		if @portfolio_item.update(portfolio_params)
			redirect_to portfolio_show_path(@portfolio_item)
		else
			render :edit
		end
	end

	def destroy
		@portfolio_item.destroy
		redirect_to portfolios_path
	end

	private

	def portfolio_params
		params.require(:portfolio).permit(:title, 
																			:subtitle, 
																			:body, 
																			:main_image, 
																			:thumb_image,
																			technologies_attributes: [:id, :name, :_destroy]
																			)
	end

	def set_portfolio_item
		@portfolio_item = Portfolio.find(params[:id])
	end
end
