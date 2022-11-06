class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")
    matching_photo = Photo.where({ :id => url_id})

    @the_photo = matching_photo.first

    render({ :template => "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    #render({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def edit
    the_id = params.fetch("path_id")

    new_url = params.fetch("input_image")
    new_caption = params.fetch("input_caption")

    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.image = new_url
    the_photo.caption = new_caption
    the_photo.save

    redirect_to("/photos/#{the_id}")
  end

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")

    new_photo.save

    redirect_to("/photos/#{new_photo.id}")
  end

  def new_comment
    new_text = params.fetch("input_body")
    new_author = params.fetch("input_author_id")
    relevant_photo_id = params.fetch("input_photo_id")

    the_new_comment = Comment.new

    the_new_comment.body = new_text
    the_new_comment.author_id = new_author
    the_new_comment.photo_id = relevant_photo_id

    the_new_comment.save

    redirect_to("/photos/#{relevant_photo_id}")
  end
end
