class Organizer < ApplicationRecord
  ORGANIZATION_NAME = 'ACME Corp.'.freeze

  has_many :integrations, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, allow_blank: true }

  def organization_name
    ORGANIZATION_NAME
  end
end
