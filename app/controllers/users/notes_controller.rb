class Users::NotesController < NotesController
  private

  # @notable　の生成
  def set_notable
    @notable = User.find(params[:user_id])
  end
end
