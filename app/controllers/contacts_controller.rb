class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create

    @contact = Contact.new(secure_param)

    if @contact.valid?
      #@contact.connect_to_db
      value = @contact.name.to_s
      @contact.insert_data_to_table("test1", value)
      #TODO send message
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def secure_param
    params.require(:contact).permit(:name, :email, :content)
  end

end
