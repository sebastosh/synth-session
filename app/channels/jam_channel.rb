class JamChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "jam"
    jam = Jam.find(params[:jam_id])
		stream_for jam
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
