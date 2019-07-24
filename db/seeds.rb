User.create(username: "seb",  password: "123" )
User.create(username: "moe",  password: "123" )

Instrument.create(name: "Bass Synth", 
# settings: {
#     firstPressed: false,
#     octave: 3,
#     name: "",
#     attack: 0.01,
#     decay: 0.1,
#     sustain: 0.3,
#     release: 1
#   }
)

Instrument.create(name: "Duo Synth", 
# settings: {
#     vibratoAmount: 0.5,
#     vibratoRate: 5,
#     harmonicity: 1.5,
#     voice0Volume: -10,
#     voice0Portamento: 0,
#     voice0OscillatorType: "sine",
#     voice0FilterEnvelopeAttack: 0.01,
#     voice0FilterEnvelopeDecay: 0,
#     voice0FilterEnvelopeSustain: 1,
#     voice0FilterEnvelopeRelease: 0.5,
#     voice0EnvelopeAttack: 0.01,
#     voice0EnvelopeDecay: 0,
#     voice0EnvelopeSustain: 1,
#     voice0EnvelopeRelease: 0.5,
#     voice1Volume: -10,
#     voice1Portamento: 0,
#     voice1OscillatorType: "sine",
#     voice1FilterEnvelopeAttack: 0.01,
#     voice1FilterEnvelopeDecay: 0,
#     voice1FilterEnvelopeSustain: 1,
#     voice1FilterEnvelopeRelease: 0.5,
#     voice1EnvelopeAttack: 0.01,
#     voice1EnvelopeDecay: 0,
#     voice1EnvelopeSustain: 1,
#     voice1EnvelopeRelease: 0.5
#   }
   )

Session.create(name: "Session 01", user_id: 1, instrument_id: 1 )
Session.create(name: "Session 02", user_id: 1, instrument_id: 2 )
Session.create(name: "Session 03", user_id: 2, instrument_id: 1 )
Session.create(name: "Session 04", user_id: 2, instrument_id: 2 )
 