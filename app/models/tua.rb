=beginclass Tua
  include Mongoid::Document
  field :pid,   type: String
  field :level, type: String
  store_in collection: "tua_201903"
end=end