class UsersController < ApplicationController
  def index
    matching_users = User.all.order({ :username => asc})
    @list_of_users
    render({ :template => "user_templates/index.html.erb"})
  end
end
