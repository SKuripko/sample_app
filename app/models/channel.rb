# frozen_string_literal: true

class Channel < DevMaSchema
  self.table_name = 'channel'
  has_many :hit
  belongs_to :order

  def self.search(term)
    where('name LIKE ?', "%#{term}%")
  end
end
