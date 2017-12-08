class UploadsController < ApplicationController
  def create
    upload = Upload.new(upload_params)
    if upload.save
      render json: upload.to_json(methods: [:attachment_url])
    else
      render json: { errors: upload.errors.full_messages.join(', ') }
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:attachment)
  end
end
