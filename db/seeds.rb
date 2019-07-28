User.create(username: "seb",  password: "123" )
User.create(username: "moe",  password: "123" )

Instrument.create(name: "Bass Synth")
Instrument.create(name: "Duo Synth")

Session.create(name: "Drone Rituals")
Session.create(name: "Noise Story")

UserSession.create(user_id: 1, session_id: 1)
UserSession.create(user_id: 1, session_id: 2)
UserSession.create(user_id: 2, session_id: 1)
UserSession.create(user_id: 2, session_id: 2)

SessionInstrument.create(instrument_id: 1, session_id: 1)
SessionInstrument.create(instrument_id: 1, session_id: 2)
SessionInstrument.create(instrument_id: 2, session_id: 1)
SessionInstrument.create(instrument_id: 2, session_id: 2)