class Message < ApplicationRecord
    after_create_commit { MessageBroadcastJob.perform_later self }

    belongs_to :user

    def user_name
        user.name
    end
end
