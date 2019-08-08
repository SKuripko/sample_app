class ServiceCart < ApplicationRecords
  belongs_to :orders
  belongs_to :ticket_avia, foreign_key: "ticket_uid"
end

class TicketAvia < ApplicationRecords
  has_one :service_cart
  has_many :flight
end

class Flight < ApplicationRecords
  belongs_to :ticket_avia, foreign_key: "ticket_uid"
end

class Partner < ApplicationRecords
  belongs_to :orders
  belongs_to :channel
end

class OrderStatusLog < ApplicationRecords
  belongs_to :orders
end

class hit < ApplicationRecords
  belongs_to :orders
end

class channel < ApplicationRecords
  has_one :partner
end