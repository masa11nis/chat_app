class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', user_name: message.user_name, message: message.content
    # Do something later
  end
end
