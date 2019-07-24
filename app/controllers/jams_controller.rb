class JamsController < ApplicationController

	def create
		jam = Jam.create(name: params[:name])
		render json: prepare_jam(jam)
	end

	def index
		render json: Jam.all.map { |jam| prepare_jam(jam)  }
	end

	def open
		jam = Jam.find(params[:jam_id])
		if jam
			render json: prepare_jam(jam, true)
		else
			render json: {error: "Sad trumpet sound"}
		end
	end

	def add_message
		jam = Jam.find(params[:jam_id])
		user = User.find(params[:user_id])
		
		if jam && user
			message = Message.create(jam: jam, user: user, content: params[:content])

			JamChannel.broadcast_to(jam, {
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

		jam = Jam.find(params["jam_id"])

		JamChannel.broadcast_to(jam, {
				type: "DELETE_MESSAGE",
				payload: {message_id: params["message_id"]} 
			})
	end

	private 

	def prepare_jam(jam, with_messages = false)
		jam_hash = {
			name: jam.name,
			id: jam.id
		}
		if with_messages
			jam_hash[:messages] = jam.messages.map {|message| prepare_message(message)}
		end
		jam_hash
		
	end

	def prepare_message(message)
		message_hash = {
			id: message.id,
			content: message.content,
			username: message.user.username
		}
	end
	
end