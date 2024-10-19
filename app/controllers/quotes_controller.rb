class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  
  def def index
    @quotes = Quote.all
  end

  def show
    
  end

  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new
    end
  end
  
  def edit
    
  end

  def update
    @quote = Quote.find(quote_params)
      if @quote.update_attributes(quote_params)
        # flash[:success] = "Quote was successfully updated"
        redirect_to quotes_path, notice: "Quote was successfully updated."
      else
        # flash[:error] = "Something went wrong"
        render :edit
      end
  end
  
  def destroy
    @quote = Quote.find(quote_params)
    if @quote.destroy
      # flash[:success] = 'Quote was successfully deleted.'
      redirect_to quotes_path, notice: "Quote was successfully deleted."
    # else
      # flash[:error] = 'Something went wrong'
      redirect_to quote@quotes_url
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end
  
  def quote_params
    params.require(:quote).permit(:name)
  end
  
end
