class Admin::BingoCardsController < Admin::BaseController
  def index
    @bingo_cards = BingoCard.all
  end

  def new
    @bingo_card = BingoCard.new
  end

  def create
    @bingo_card = BingoCard.new(bingo_card_params)
    if @bingo_card.save
      flash[:notice] = "Bingo Card saved"
      redirect_to admin_bingo_cards_path
    else
      flash[:alert] = @bingo_card.errors.full_messages.join("\n")
      render :new
    end
  end

  def show
    @bingo_card = BingoCard.find(params[:id])
  end

  private

  def bingo_card_params
    params.require(:bingo_card).permit(:name, :columns, :rows, :start_date, :end_date)
  end
end
