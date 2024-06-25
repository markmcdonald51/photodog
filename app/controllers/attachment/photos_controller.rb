class Attachment::PhotosController < ApplicationController
  before_action :set_attachment_photo, only: %i[ show edit update destroy ]

  # GET /attachment/photos or /attachment/photos.json
  def index
    #@photos = Photo.page params[:page]
    @attachment_photos = Attachment::Photo.with_attached_image.page(params[:page])
  end

  # GET /attachment/photos/1 or /attachment/photos/1.json
  def show
  end

  # GET /attachment/photos/new
  def new
    @attachment_photo = Attachment::Photo.new
  end

  # GET /attachment/photos/1/edit
  def edit
  end

  # POST /attachment/photos or /attachment/photos.json
  def create
    @attachment_photo = Attachment::Photo.new(attachment_photo_params)

    respond_to do |format|
      if @attachment_photo.save
        format.html { redirect_to attachment_photo_url(@attachment_photo), notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @attachment_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachment/photos/1 or /attachment/photos/1.json
  def update
    respond_to do |format|
      if @attachment_photo.update(attachment_photo_params)
        format.html { redirect_to attachment_photo_url(@attachment_photo), notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment/photos/1 or /attachment/photos/1.json
  def destroy
    @attachment_photo.destroy!

    respond_to do |format|
      format.html { redirect_to attachment_photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment_photo
      @attachment_photo = Attachment::Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_photo_params
      params.require(:attachment_photo).permit(:title, :altitude, :latitude, :longitude, :image_views, :photo_taken_time, :url, :description, :device_id)
    end
end
