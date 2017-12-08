class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chatroom


  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save

    # binding.pry
  #   respond_to do |format|
  #     if message.save
  #       format.html {
  #           render :json => [message.to_jq_upload].to_json,
  #           :content_type => 'text/html'
  #         }
  #         format.json { render json: {files: [message.to_jq_upload]}, status: :created, location: message }
  #       else
  #         format.html { render action: "new" }
  #         format.json { render json: message.errors, status: :unprocessable_entity }
  #       end
  #     end
  # end

  private

    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end

    def message_params
      params.require(:message).permit(:content,:picture)
    end
end
