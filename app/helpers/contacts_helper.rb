module ContactsHelper

  def address
    @address_array = [contact.address_street, contact.address_street2, contact.address_city, contact.address_state, contact.address_city, contact.address_country, contact.address_postcode]
    @address_array.reject(&:blank?).join(", ")
  end
end
