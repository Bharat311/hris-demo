class Integration < ApplicationRecord
  CATEGORIES = %i(ats hris).freeze

  belongs_to :organizer

  before_create :set_uuid

  validates :organizer, presence: true

  enum category: CATEGORIES

  def merge_categories
    Array((category || CATEGORIES))
      .map.with_index { |c, idx| [idx, c] }
      .to_h
  end

  def merge_link_params
    return {} unless organizer

    {
      integration: provider,
      categories: merge_categories,
      end_user_origin_id: uuid,
      end_user_email_address: organizer.email,
      end_user_organization_name: organizer.organization_name
    }
  end

  def merge_link
    MergeApi.create_link_token(merge_link_params)
  end

  def data
    case category
    when 'ats'  then candidates
    when 'hris' then employees
    end
  end

  def sync
    case category
    when 'ats'  then MergeApi.ats_resync(account_token)
    when 'hris' then MergeApi.hris_resync(account_token)
    end
  end

  def unlink
    case category
    when 'ats'  then MergeApi.ats_delete(account_token)
    when 'hris' then MergeApi.hris_delete(account_token)
    end
  end

  def employees
    @employees ||= begin
      response = MergeApi.hris_employees(account_token)
      JSON.parse(response.body).fetch('results', [])
    end
  end

  def candidates
    @candidates ||= begin
      response = MergeApi.ats_candidates(account_token)
      JSON.parse(response.body).fetch('results', [])
    end
  end

  private def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
