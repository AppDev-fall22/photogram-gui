class UsersController < ApplicationController
  def index
    matching_users = User.all.order({ :username => :asc})
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.first

    render({ :template => "user_templates/show.html.erb"})
  end

  def new_user
    the_new_user = User.new

    the_new_user.username = params.fetch("input_username")
    the_new_user.save

    redirect_to("/users/#{the_new_user.username}")
  end

  def update_user
    relevant_user_id = params.fetch("path_id")
    new_username = params.fetch("input_username")

    the_user = User.where({ :id => relevant_user_id}).at(0)

    the_user.username = new_username
    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end
