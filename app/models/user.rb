# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :companies

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: %w[teacher student]

  validates :name, :surname, :role, :email, presence: true
end
