class UsersController < ApplicationController
  def main
    
    render({ :template => "users/main" })
  end
end
