# frozen_string_literal: true

# class User
class User < ApplicationRecord
  has_many :asset_histories
  belongs_to :assets , optional: true

  validates :name, length: { minimum: 2, maximum: 50 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
