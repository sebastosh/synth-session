User.create(username: "seb",  password: "123" )
User.create(username: "moe",  password: "123" )

Instrument.create(name: "Bass Synth" )
Instrument.create(name: "Duo Synth" )

Session.create(name: "1st Session", user_id: 1, instrument_id: 1 )
Session.create(name: "a session", user_id: 2, instrument_id: 1 )

Session.create(name: "Other Session", user_id: 1, instrument_id: 2 )
Session.create(name: "that session", user_id: 2, instrument_id: 2 )

