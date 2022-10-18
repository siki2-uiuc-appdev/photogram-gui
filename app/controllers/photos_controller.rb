class PhotosController < ApplicationController
  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    #   Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.first

    the_photo.destroy

    # render({ :template => 'photo_templates/delete.html.erb'})

    redirect_to('/photos')
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/#{a_new_photo.id}")
  end

  def update
    #  Parameters: {"query_image"=>"https://robohash.org/errorexpeditacum.png?size=300x300&set=set1", "query_caption"=>"test2", "modify_id"=>"952"}
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

  def add_comment
    #  Parameters: {"query_photo_id"=>"777", "query_author_id"=>"117", "query_comment"=>"check 1,2"}
    photo_id = params.fetch("query_photo_id")


    commenting_author_id = params.fetch("query_author_id")
    new_comment_body = params.fetch("query_comment")

    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = commenting_author_id
    new_comment.body = new_comment_body

    new_comment.save

  

    # render({ :template => "photo_templates/add_new_comment.html.erb"})
    redirect_to("/photos/#{new_comment.photo_id}")
  end

end
