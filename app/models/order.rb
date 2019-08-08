class Order < DevMaSchema
  self.table_name = "order"
  has_many :hit
  has_many :channel
end