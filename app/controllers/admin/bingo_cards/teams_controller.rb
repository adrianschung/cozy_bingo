class Admin::BingoCards::TeamsController < Admin::BaseController
  helper_method :current_bingo_card

  def new
    @team = current_bingo_card.teams.new
    @team.team_users.build
  end

  def create
    @team = current_bingo_card.teams.new(team_params)
    if @team.save
      flash[:notice] = "Team saved"
      redirect_to admin_bingo_card_path(current_bingo_card)
    else
      flash[:alert] = @team.errors.full_messages.join("\n")
      render :new
    end
  end

  private

  def current_bingo_card
    @bingo_card ||= BingoCard.find(params[:bingo_card_id])
  end

  def team_params
    params.require(:team).permit(:name, team_users_attributes: [:id, :user_id, :_destroy])
  end

end
