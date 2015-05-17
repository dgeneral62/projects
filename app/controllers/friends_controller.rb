class FriendsController < ApplicationController

  def auto_complete_search
    begin
    @friends1 = Friend.complete_for(params[:search])
  rescue ScopedSearch::QueryNotSupported => e
    @friends1 = [{:error =>e.to_s}]
  end
  render :json =>@friends2
  end

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
    # User.search_for('my search string').each { |user| ... }
    @friends2 = Friend.search(params[:search], :order => params[:order]).all(:include => :release_date)
  rescue => e
    flash[:error] = e.to_s
    #@friends2= Friend.search_for ''
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = current_user.friends.build(:gamer_id => params[:gamer_id])
    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Added Friend.' }
        redirect_to user_friends_url
      else
        flash[:error] = "Unable to add friend."
        redirect_to user_friends_url
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = current_user.friends.find(params[:id])
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to user_friends_url, notice: 'You have Un-Friended.' }
    end
  end
end
