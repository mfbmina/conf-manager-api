class SpeakersController < APIController
  before_action :set_speaker, only: %i[show update destroy]

  def index
    @speakers = Speaker.with_attached_avatar
    json_response(@speakers)
  end

  def create
    @speaker = Speaker.create!(speaker_params)
    json_response(@speaker, :created)
  end

  def show
    json_response(@speaker)
  end

  def update
    @speaker.update(speaker_params)
    head :no_content
  end

  def destroy
    @speaker.destroy
    head :no_content
  end

  private

  def speaker_params
    params.permit(:name, :company, :email, :avatar, :social_media)
  end

  def set_speaker
    @speaker = Speaker.find(params[:id])
  end
end
