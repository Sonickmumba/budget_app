class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'author_id', dependent: :destroy

  # validations
  validates :name, presence: true, allow_blank: false
end
