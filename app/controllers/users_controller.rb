class UsersController < ApplicationController
  
  def index 
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_usenname"=>"anisa"}

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    # if !the_user
    #   redirect_to("/404")
    # else
    render({ :template => "user_templates/show.html.erb"})
    # end
  end

  def create
    input_username = params.fetch("query_user")

    new_user = User.new
    new_user.username = input_username

    new_user.save

    redirect_to("/users/#{new_user.username}")
  end

  def update
    current_username = params.fetch("path_username")
    new_username = params.fetch("query_user")

    mathching_usernames = User.where({ :username => current_username })
    the_user = mathching_usernames.first

    the_user.username = new_username

    the_user.save

    
    redirect_to("/users/#{the_user.username}")
  end

end
