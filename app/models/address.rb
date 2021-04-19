class Address < ActiveRecord::Base
    belongs_to :user

    validates :name, :street_name, :city, :state, :zip_code, :contact,  presence: true

end