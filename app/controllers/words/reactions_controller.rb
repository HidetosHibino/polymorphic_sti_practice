class Words::ReactionsController < ApplicationController
  before_action :set_reaction, only: %i[new]

  def new; end

  def create
    @reaction = Reaction.create(reaction_params)
    if @reaction.save
      logger.debug(@reaction.inspect)
      redirect_to @reaction.word, notice: "#{@reaction.type} was successfully created."
    else
      redirect_to new_polymorphic_url([@reaction.word, @reaction]), notice: "Fail creating #{@reaction.type}."
    end
  end

  private 

  def set_reaction
    # param にアプリ内に存在するクラスを適当に入れてリクエストすることで、意図しないクラスにもアクセス出来てしまう。
    # 実際に使うときは :type が意図したものかチェックする処理を入れること！！  
    @reaction = params[:type].constantize.new()
    @reaction.word = Word.find(params[:word_id])
  end

  def reaction_params
    params.require(params[:type].underscore.to_sym).permit(:body, :type, :word_id)
  end
end
