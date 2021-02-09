class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    #post新規投稿、一覧表示用変数
    @post = Post.new
    @posts = Post.where(member_id: @member.id).order("created_at DESC")
    #binding.pry
    @genres = Genre.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end

  def withdraw
  end

  def unsubscribe
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :account_name, :profile_image, :introduction)
  end

end
