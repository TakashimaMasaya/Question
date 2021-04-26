class QuestsController < ApplicationController
  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user_id = current_user.id
    if @quest.save
      redirect_to quests_url, notice: "質問「#{@quest.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @answers = @quest.answers
    @answer = Answer.new
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    quest = Quest.find(params[:id])
    quest.update!(quest_params)
    redirect_to quests_url, notice: "質問「#{quest.title}」を更新しました。"
  end

  def destroy
    quest = Quest.find(params[:id])
    quest.destroy
    redirect_to quests_url, notice: "質問「#{quest.title}」を削除しました。"
  end

  private

  def quest_params
    params.require(:quest).permit(:title, :description)
  end
end
