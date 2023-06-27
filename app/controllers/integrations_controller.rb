class IntegrationsController < ApplicationController
  before_action :set_organizer, except: :ingest
  before_action :set_integration, except: :ingest

  def merge_link
    render json: @integration.merge_link, status: :ok
  end

  def destroy
    @integration.destroy
  end

  def ingest
    Datum.create!(body: params[:data])
  end

  private
    def set_organizer
      @organizer = Organizer.find(params[:organizer_id])
    end

    def set_integration
      @integration = @organizer.integrations.where(uuid: params[:uuid]).first_or_create
    end
end
