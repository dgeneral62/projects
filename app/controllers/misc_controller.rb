class MiscController < ApplicationController
  def createGoogle
    gid = params[:gid]
    user = User.where(google: gid)
    respond_to do |format|
        format.json { render json: user }
    end
  end
end