class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sessions, :users
end
