class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i[ edit update destroy create ]
  load_and_authorize_resource

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @gallery = Gallery.find(params[:photo][:gallery_id])
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @photo = Photo.find(params[:id])
  end

  # POST /photos or /photos.json
  def create
    @gallery_to_attach = Gallery.find(params[:photo][:gallery_id])
    @photo = Photo.new(photo_params)
    @photo.image.attach(params[:photo][:image])

    respond_to do |format|
      if @photo.save && @photo.image.attached?
        @gallery_to_attach.photos << @photo
        @photo.create_thumbnail(@photo)

        format.html { redirect_to gallery_path(@gallery_to_attach), notice: "Photo was successfully added." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    @gallery = Gallery.find(params[:photo][:gallery_id])
    respond_to do |format|
      if @photo.update(photo_params)
        @photo.create_thumbnail(@photo)
        format.html { redirect_to gallery_path(@gallery), notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy!

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, status: :see_other, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # DELETE /photos/:id/destroy_image(:format)
  def destroy_image
    @photo.image.purge
    @gallery = Gallery.find(params[:gallery_id])
    redirect_to edit_photo_path(@photo, gallery_id: @gallery.id), notice: "Image was removed successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:photo_id, :alt_text, :user_id, :image)
    end
end
