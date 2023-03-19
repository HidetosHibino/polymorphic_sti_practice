class RatesController < ApplicationController
  before_action :set_ratable, only: %i[new create]
  def index
    @rates = Rate.all
  end

  def new
    @rate = @ratable.rates.new
  end

  def create
    # typeをそのまま使う場合は以下
    # @rate = @ratable.new(rate_params)
    st_rate_type = "#{params[:rate][:rate_type]}_rates"
    @rate = @ratable.send(st_rate_type).new(rate_params)
    if @rate.save
      redirect_to @ratable, notice: "Rate was successfully created."
    else      
      # flash.now[:notice] = "Fail creating #{@rate.type}."
      # render した場合、@rate はSTIの子クラスとなっているため、newで作った時と異なる（newでは @rate = @ratable.rates.new で親クラス）
      # そのためそのままでは使えないので、今回はリダイレクト
      # render "#{@ratable.class.to_s.pluralize.underscore}/rates/new", status: :unprocessable_entity
      redirect_to new_polymorphic_path([@ratable, Rate]), notice: "Fail creating #{@rate.type}."
    end

  end

  private

  def rate_params
    # typeをそのまま使っていい場合や,多元配列でプルダウンを宣言する場合は以下。stiのtypeに不正な値は入らない（nil or 子クラスのみ)
    # params.require(:rate).permit(:voter_id,:type)
    params.require(:rate).permit(:voter_id)
  end

  # @notableの生成は各controllerでオーバーライドして行う
  def set_ratable
    raise NotImplementedError
  end
end
