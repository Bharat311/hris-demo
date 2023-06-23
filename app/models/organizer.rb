class Organizer < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, allow_blank: true }

  def hash
    Digest::MD5.hexdigest(email)
  end

  def organization_name
    'ACME Corp.'
  end

  def merge_api
    @merge_api ||= MergeApi.new(self)
  end
end
