User.create(username: "seb",  password: "123" )
User.create(username: "moe",  password: "123" )

Instrument.create(name: "Bass Synth", settings: {})
Instrument.create(name: "Duo Synth", settings: {} )

Session.create(name: "Session 01", user_id: 1, instrument_id: 1 )
Session.create(name: "Session 02", user_id: 2, instrument_id: 1 )
Session.create(name: "Session 03", user_id: 1, instrument_id: 2 )
Session.create(name: "Session 04", user_id: 2, instrument_id: 2 )
 