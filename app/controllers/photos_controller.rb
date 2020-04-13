class PhotosController < ApplicationController
  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result(:distinct => true).includes(:article).page(params[:page]).per(10)

    render("photo_templates/index.html.erb")
  end

  def show
    @photo = Photo.find(params.fetch("id_to_display"))

    render("photo_templates/show.html.erb")
  end

  def new_form
    @photo = Photo.new

    render("photo_templates/new_form.html.erb")
  end

  def create_row
    @photo = Photo.new

    @photo.article_id = params.fetch("article_id")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_back(:fallback_location => "/photos", :notice => "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_article
    @photo = Photo.new

    @photo.article_id = params.fetch("article_id")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_to("/articles/#{@photo.article_id}", notice: "Photo created successfully.")
    else
      render("photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo = Photo.find(params.fetch("prefill_with_id"))

    render("photo_templates/edit_form.html.erb")
  end

  def update_row
    @photo = Photo.find(params.fetch("id_to_modify"))

    @photo.article_id = params.fetch("article_id")
    @photo.image = params.fetch("image") if params.key?("image")

    if @photo.valid?
      @photo.save

      redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
    else
      render("photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_article
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/articles/#{@photo.article_id}", notice: "Photo deleted successfully.")
  end

  def destroy_row
    @photo = Photo.find(params.fetch("id_to_remove"))

    @photo.destroy

    redirect_to("/photos", :notice => "Photo deleted successfully.")
  end
end
