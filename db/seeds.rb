User.create(username: "seb",  password: "123" )
User.create(username: "moe",  password: "123" )

Instrument.create(name: "My First Mono Synth", instrument_type: "MonoSynth")
Instrument.create(name: "My First Duo Synth", instrument_type: "DuoSynth")
Instrument.create(name: "My First Drum Synth", instrument_type: "DrumSynth")

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
SessionInstrument.create(instrument_id: 3, session_id: 1)
SessionInstrument.create(instrument_id: 3, session_id: 2)