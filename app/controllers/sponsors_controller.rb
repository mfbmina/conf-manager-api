class SponsorsController < APIController
  skip_before_action :authorize_request, only: :index
  before_action :set_sponsor, only: %i[show update destroy]

  def index
    @sponsors = Sponsor.with_attached_logo
    json_response(@sponsors)
  end

  def create
    @sponsor = Sponsor.create!(sponsor_params)
    json_response(@sponsor, :created)
  end

  def show
    json_response(@sponsor)
  end

  def update
    @sponsor.update(sponsor_params)
    head :no_content
  end

  def destroy
    @sponsor.destroy
    head :no_content
  end

  private

  def sponsor_params
    params.permit(:name, :website, :tier, :logo)
  end

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end
end
