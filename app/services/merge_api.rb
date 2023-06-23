class MergeApi
  include HTTParty

  API_KEY = Rails.application.credentials.merge_api_key.freeze

  base_uri 'https://api.merge.dev/api/integrations'

  headers content_type: 'application/json',
          authorization: "Bearer #{API_KEY}"

  def initialize(organizer)
    @organizer = organizer
  end

  def create_link_token
    body = {
      categories: { 0 => 'ats', 1 => 'hris' },
      end_user_origin_id: @organizer.hash,
      end_user_email_address: @organizer.email,
      end_user_organization_name: @organizer.organization_name
    }

    self.class.post('/create-link-token', body: body)
  end
end
