require 'test_helper'

class UserGamesControllerTest < ActionController::TestCase
  setup do
    @user_game = user_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_game" do
    assert_difference('UserGame.count') do
      post :create, user_game: { name: @user_game.name, platform: @user_game.platform, publisher: @user_game.publisher, rating: @user_game.rating, release_date: @user_game.release_date }
    end

    assert_redirected_to user_game_path(assigns(:user_game))
  end

  test "should show user_game" do
    get :show, id: @user_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_game
    assert_response :success
  end

  test "should update user_game" do
    patch :update, id: @user_game, user_game: { name: @user_game.name, platform: @user_game.platform, publisher: @user_game.publisher, rating: @user_game.rating, release_date: @user_game.release_date }
    assert_redirected_to user_game_path(assigns(:user_game))
  end

  test "should destroy user_game" do
    assert_difference('UserGame.count', -1) do
      delete :destroy, id: @user_game
    end

    assert_redirected_to user_games_path
  end
end