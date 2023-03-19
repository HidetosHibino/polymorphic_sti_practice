class Users::RatesController < RatesController
  private

  def set_ratable
    @ratable = User.find(params[:user_id])
  end
end
