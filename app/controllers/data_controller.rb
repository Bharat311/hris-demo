class DataController < ApplicationController
  skip_forgery_protection

  def ingest
    Datum
      .where(provider: params[:service])
      .first_or_create!(
        body: params[:data]
      )
  end

  def sync
    jwt = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiaGFyYXRAdmluc29sLmNvbSIsImlhdCI6MTY4Nzg0MjY5OCwiZXhwIjoxNjg3OTI5MDk4fQ.iTVcxk_SA4j1nBWsGc2i7G8LSI5yx859OSwGos-F7PtQR2oyt7TNSzii04Le6x3lwyngGo-vjorfCy2_cznirPeYxh-PuWJ3_exWL0TpMhwc19wMnOztcHxJSV2-VzdaF1XCEKtnDC1r5Tx0JaSFffe9UHzZHj0wKG_9_iXdtxI3G4v9GNqNl4Mwba5Rc72xb05HZoRie_yfnQgv8h__dX7D_FiBDnRwD7nC5ZPDWEx78R7hDtIBJGzheZwAq9_AaACqqGb1y3OiNEnVtwqWhu-k0wHSh2CJQ1-690jWFQiaVPnisobGT8KOvnxT1CBOace1w5Rcf_uc8bR5HDI8QNConvPaorFvw1WpO7bZegc7udDqgLzNXhkuYNpyQjJI1Jw7EcW4kAYihLqsOlCL6zFakXxUvW9ZE5_9OwwyOnx_GQJmh07euaydTqVAqinlOGRGFdTPzT7rj70uqTQeBWLjffTOoetB3cUsns0fppMk3OL5CKt1oqvaVyC-fM_kTWIZBO9nVLVsflZ7FwlXqUVL7UcH4E20487RP6PFCoWGkqjpQJMwUvse_e1IyfUiO0xGMQ8uLAqMBUQrFCA1uTKi6QnZp_p8hq7C1hCkzSOrLAnPVpcqff4lFHwG4nb3mqsfDcQsg57VeKbZcTEVuOBj25V1xMaKPjRLLRTZZxQ"
    HTTParty.post('https://zeus.useparagon.com/projects/d8ab5c29-e437-452d-9a1a-269b03ae194b/sdk/triggers/470c8812-3f2b-40c2-a9bd-3b942d64b128', headers: { 'Authorization' => "Bearer #{jwt}" })
    head :ok
  end

  def clear
    Datum.where(provider: params[:service]).destroy_all
    redirect_back fallback_location: root_path
  end
end
