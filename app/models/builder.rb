class Builder < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email,:first_name, :last_name, :company_name, :phone, :country, :address, :city 
  # attr_accessible :title, :body
validates :phone, numericality: { only_integer: true },:length => {:minimum => 10, :maximum => 10}

#validates_format_of :first_name, :with => /\A[[:graph:]]\Z/i




validates_format_of :first_name,:last_name,:company_name ,:address, :city,:with => /\A[^\d]+\Z/, :message => "field should only have letters"
end
