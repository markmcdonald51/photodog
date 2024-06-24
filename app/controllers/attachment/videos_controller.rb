class Attachment::VideosController < ApplicationController
  before_action :set_attachment_video, only: %i[ show edit update destroy ]

  # GET /attachment/videos or /attachment/videos.json
  def index
    @attachment_videos = Attachment::Video.all
  end

  # GET /attachment/videos/1 or /attachment/videos/1.json
  def show
  end

  # GET /attachment/videos/new
  def new
    @attachment_video = Attachment::Video.new
  end

  # GET /attachment/videos/1/edit
  def edit
  end

  # POST /attachment/videos or /attachment/videos.json
  def create
    @attachment_video = Attachment::Video.new(attachment_video_params)

    respond_to do |format|
      if @attachment_video.save
        format.html { redirect_to attachment_video_url(@attachment_video), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @attachment_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachment/videos/1 or /attachment/videos/1.json
  def update
    respond_to do |format|
      if @attachment_video.update(attachment_video_params)
        format.html { redirect_to attachment_video_url(@attachment_video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment/videos/1 or /attachment/videos/1.json
  def destroy
    @attachment_video.destroy!

    respond_to do |format|
      format.html { redirect_to attachment_videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment_video
      @attachment_video = Attachment::Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_video_params
      params.require(:attachment_video).permit(:title, :altitude, :latitude, :longitude, :image_views, :photo_taken_time, :url, :description, :device_id)
    end
end
