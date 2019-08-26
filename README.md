[View Demo](https://modest-saha-2b5751.netlify.com/)

[View React Frontend Repo](https://github.com/sebastosh/synthsession-front)

# SynthSessions - Back End Server 
Backend Rails Api for web app designed for multi-synthesizer jamming sessions.  

React, ToneJS, NexusUI, Rails API, JWT Auth 

* Ruby version 2.6.3

* System dependencies: fast_jsonapi, cors, bcrypt, JWT 

* Database initialization: Postgres + seed.rb 

```
rake db:drop db:create db:migrate db:seed
```

## Synth Sessions

A web app designed for multi-synthesizer jamming. Users can create a session and choose to add one or more synthesizer modules (current choices, a Mono Synth, Duo Synth, and FM synth) to their sessions. They can play each synth with the on-screen keys or with a computer keyboard. 

## Key Technologies, Packages, and Gems

* Front End

  * React.js
  * Tone.js
  * nexusUI
  * react-select

* Back End

  * Rails 5 API
  * JWT token authentication
  * BCrypt
  * Postgres database
  * fast_jsonapi serializer

## Core Features

* Unregistered users can jam solo with synths but will be prompted to signup when saving a session or synth parameters.
* A session show page displays a menu to add 1 to 3 different synthesizer modules at any time. 
* Session and modules names can be edited inline. 
* Module parameters (Gain, Envelopes, Harmonics, etc..) can be each be saved to backend server and restored in future sessions.

## Demo

[View live demo here](https://modest-saha-2b5751.netlify.com/)



 


