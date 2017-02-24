class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @alphabetical_contacts = Contact.order("surname ASC").group_by{|u| u.surname[0]}
    @alphabetical_contacts_first = Contact.order("firstname ASC").group_by{|u| u.firstname[0]}
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @notes = @contact.notes.reverse
    @tasks = @contact.tasks.reverse
    @hash = Gmaps4rails.build_markers(@contact) do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
    end

  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:firstname, :surname, :birthday, :job_title, :website, :primary_phone, :email, :bio, :address_street, :address_street2, :address_city, :address_state, :address_postcode, :address_country, :latitude, :longitude, :referred_by, :twitter, :linkedin)
    end
end
