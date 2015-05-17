class FriendsController < ApplicationController

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
