class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :settings, :sessions, :users
end
