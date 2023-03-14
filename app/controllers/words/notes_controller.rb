class Words::NotesController < NotesController
  private
  
  def set_notable
    @notable = Word.find(params[:word_id])
  end
end
