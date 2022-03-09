class InquiryController < ApplicationController

  def new
  	@inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render :new if @inquiry.invalid?
  end

  def create
  	inquiry = Inquiry.new(inquiry_params)
  	inquiry.save
  	redirect_to root_path
  end

  def index
  end

  def show
  end


  private 
  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :phone_number, :corporate_name, :department_name, :content)
  end

end
