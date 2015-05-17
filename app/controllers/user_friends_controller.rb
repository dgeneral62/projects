class UserFriendsController < ApplicationController
  before_action :set_user_friend, only: [:show, :edit, :update, :destroy]

  def auto_complete_search
    begin
      @user_friends1 = UserFriend.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @user_friends1 = [{:error =>e.to_s}]
    end
    render :json =>@user_friends2
  end

  # GET /user_friends
  # GET /user_friends.json
  def index
    @user_friends = UserFriend.all

    @user_friends2 = UserFriend.search(params[:search], :order => params[:order])
    rescue => e
    flash[:error] = e.to_s
    #@user_friends2 = UserFriend.search_for ''
  end

  # GET /user_friends/1
  # GET /user_friends/1.json
  def show
  end

  # GET /user_friends/new
  def new
    @user_friend = UserFriend.new
  end

  # GET /user_friends/1/edit
  def edit
  end

  # POST /user_friends
  # POST /user_friends.json
  def create
    @user_friend = UserFriend.new(user_friend_params)

    respond_to do |format|
      if @user_friend.save
        format.html { redirect_to @user_friend, notice: 'User friend was successfully created.' }
        format.json { render :show, status: :created, location: @user_friend }
      else
        format.html { render :new }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_friends/1
  # PATCH/PUT /user_friends/1.json
  def update
    respond_to do |format|
      if @user_friend.update(user_friend_params)
        format.html { redirect_to @user_friend, notice: 'User friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_friend }
      else
        format.html { render :edit }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_friends/1
  # DELETE /user_friends/1.json
  def destroy
    @user_friend.destroy
    respond_to do |format|
      format.html { redirect_to user_friends_url, notice: 'User friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_friend
      @user_friend = UserFriend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_friend_params
      params.require(:user_friend).permit(:gamer_id, :name, :player_rank, :platform)
    end
end
