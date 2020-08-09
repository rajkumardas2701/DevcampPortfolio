class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit update destroy show]
  layout 'portfolio'
  access all: %i[show index angular], user: { except: %i[destroy new create update edit] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_items = Portfolio.new
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    # 3.times { @portfolio_items.technologies.build }
  end

  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show; end

  def destroy
    @portfolio_items.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was Removed' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: [:id, :name, :_destroy])
  end

  def set_portfolio_item
    @portfolio_items = Portfolio.find(params[:id])
  end
end
