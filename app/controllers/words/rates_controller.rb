class Words::RatesController < RatesController
  private

  def set_ratable
    @ratable = Word.find(params[:word_id])
  end
end
