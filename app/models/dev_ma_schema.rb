# frozen_string_literal: true

class DevMaSchema < ApplicationRecord
  self.abstract_class = true
  establish_connection :dev_ma
end
