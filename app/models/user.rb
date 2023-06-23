class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, allow_blank: true }
end
