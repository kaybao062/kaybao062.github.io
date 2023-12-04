class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def create
    the_user = User.new
    the_user.cnet_id = params.fetch("query_cnet_id")
    the_user.name = params.fetch("query_name")
    the_user.password = params.fetch("query_password")
    the_user.enroll_date = params.fetch("query_enroll_date")
    the_user.graduate_date = params.fetch("query_graduate_date")

    if the_user.valid?
      the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.cnet_id = params.fetch("query_cnet_id")
    the_user.name = params.fetch("query_name")
    the_user.password = params.fetch("query_password")
    the_user.enroll_date = params.fetch("query_enroll_date")
    the_user.graduate_date = params.fetch("query_graduate_date")

    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.id}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end
end
