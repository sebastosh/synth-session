class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :sessions, :users
end
