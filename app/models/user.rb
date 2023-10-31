# frozen_string_literal: true

# class User
class User < ApplicationRecord
  has_many :asset_histories
  has_many :assets
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable,:lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # ROLES = %w{HR Employee}
  enum role: %i[hr employee]
  #   ROLES.each do |role_name|
  #     define_method "#{role_name}?" do
  #     role == role_name
  #     end
  #   end
end
