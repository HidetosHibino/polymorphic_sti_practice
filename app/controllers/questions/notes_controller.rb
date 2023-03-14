class Questions::NotesController < NotesController
  private

  def set_notable
    @notable = Question.find(params[:question_id])
  end
end
