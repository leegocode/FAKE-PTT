class Board < ApplicationRecord

acts_as_paranoid

has_many :board_masters
has_many :users, through: :board_masters

has_many :posts, dependent: :destroy

has_many :favorite_boards
has_many :favorited_users, through: :favorite_boards, source: :user



validates :title, presence: true, length: { minimum: 2 }


  def favorited_by?(u)
    favorited_users.include?(u)
  end


end
