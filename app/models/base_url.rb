class BaseUrl < DevelopSchema
  validates :name,  presence: true
  validates :value, presence: true
end
