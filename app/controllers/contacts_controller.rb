class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ edit create update destroy import ]
  before_action :set_contact, only: %i[ show edit update destroy ]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = @user.id

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    begin
      Contact.import(params[:file], @user.id, colums_params.to_hash)
    rescue ActiveRecord::RecordInvalid
      redirect_to contacts_path, alert: "Contact import aborted! Found duplicated emails in your CSV file."
    rescue ActiveModel::UnknownAttributeError
      redirect_to contacts_path, alert: "Contact import aborted! Found unknown attributes in your CSV file. Please specify your header names above."
    else
      redirect_to contacts_path, notice:  "Contacts imported successfully"
    end
    
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def contact_params
      params.require(:contact).permit(:name, :birth_date, :phone, :address, :cc, :email)
    end

    def colums_params
      params.require(:columns).permit(:name, :birth_date, :phone, :address, :cc, :email)
    end
end
