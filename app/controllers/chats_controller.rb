class ChatsController < ApplicationController

	def create
		chat = Chat.create(name: params[:name])
		render json: prepare_chat(chat)
	end

	def index
		render json: Chat.all.map { |chat| prepare_chat(chat)  }
	end

	def open
		chat = Chat.find(params[:chat_id])
		if chat
			render json: prepare_chat(chat, true)
		else
			render json: {error: "Sad trumpet sound"}
		end
	end

	def add_message
		chat = Chat.find(params[:chat_id])
		user = User.find(params[:user_id])
		
		if chat && user
			message = Message.create(chat: chat, user: user, content: params[:content])

			ChatChannel.broadcast_to(chat, {
				type: 'ADD_MESSAGE',
				payload: prepare_message(message)
			})

			render json: prepare_message(message)
		else
			render json: {error: "Sad trumpet sound"}
		end

	end

	def delete_message

		Message.find(params["message_id"]).destroy

		chat = Chat.find(params["chat_id"])

		ChatChannel.broadcast_to(chat, {
				type: "DELETE_MESSAGE",
				payload: {message_id: params["message_id"]} 
			})
	end

	private 

	def prepare_chat(chat, with_messages = false)
		chat_hash = {
			name: chat.name,
			id: chat.id
		}
		if with_messages
			chat_hash[:messages] = chat.messages.map {|message| prepare_message(message)}
		end
		chat_hash
		
	end

	def prepare_message(message)
		message_hash = {
			id: message.id,
			content: message.content,
			username: message.user.username
		}
	end
	
end