class InquiriesController < ApplicationController
  def show
    @inquiries = Inquiry.find(params[:id])
  end
  
  def contact
  end
  
  def inquiries
  end
  
  def create
    @inquiries = Inquiry.new(params[:inquiries])
 
  @inquiries.save
  redirect_to @inquiries
  end
  
end
