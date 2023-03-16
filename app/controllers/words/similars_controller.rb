class Words::SimilarsController < ApplicationController
  def new
    @similar = Word.find(params[:word_id]).similars.new
  end

  def create
    @similar = Similar.new(similar_param)
    if @similar.save
      redirect_to @similar.word, notice: "#{@similar.type} was successfully created."
    else
      # redirect_to new_polymorphic_url([@similar.word, @similar]), notice: "Fail creating #{@similar.type}."
      flash.now[:notice] = "Fail creating #{@similar.type}."
      render 'words/similars/new', status: :unprocessable_entity
    end
  end
  
  private

  def similar_param
    params.require(:similar).permit(:word_id, :type, :similar_id)
  end
end
