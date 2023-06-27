class MergeApi
  include HTTParty

  API_KEY = Rails.application.credentials.merge_api_key.freeze

  base_uri 'https://api.merge.dev/api'

  headers content_type: 'application/json',
          authorization: "Bearer #{API_KEY}"

  class << self
    def account_token(public_token)
      get("/integrations/account-token/#{public_token}")
    end

    def create_link_token(body)
      post('/integrations/create-link-token', body: body)
    end

    def hris_employees(account_token)
      get('/hris/v1/employees', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end

    def hris_resync(account_token)
      post('/hris/v1/sync-status/resync', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end

    def ats_candidates(account_token)
      get('/ats/v1/candidates', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end

    def ats_resync(account_token)
      post('/ats/v1/sync-status/resync', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end

    def hris_delete(account_token)
      post('/hris/v1/delete-account', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end

    def ats_delete(account_token)
      post('/ats/v1/delete-account', headers: { 'X-ACCOUNT-TOKEN' => account_token })
    end
  end
end
