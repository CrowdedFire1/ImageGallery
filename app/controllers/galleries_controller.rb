class GalleriesController < ApplicationController
  before_action :authenticate_user!, only: %i[ new edit update destroy create ]
  load_and_authorize_resource

  # GET /galleries or /galleries.json
  def index
    # paramters passed in to prevent sql injection
    @galleries = Gallery.where("hidden = ?", false)
  end

  # GET /your_galleries
  def your_galleries
    @galleries = Gallery.where("user_id = ?", current_user.id)
  end

  # GET /galleries/1
  def show
    # photo object is stored here (and regenerated each page refresh) for the photo uploading
    @gallery = Gallery.find(params[:id])
    @photo = Photo.new
    @gallery_photos = @gallery.photos
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries or /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: "Gallery was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1 or /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: "Gallery was successfully updated." }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1 or /galleries/1.json
  def destroy
    @gallery.destroy!

    respond_to do |format|
      format.html { redirect_to galleries_path, status: :see_other, notice: "Gallery was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gallery_params
      params.expect(gallery: [ :gallery_id, :name, :hidden, :description ])
    end
end
