# frozen_string_literal: true

class DevelopSchema < ApplicationRecord
  self.abstract_class = true
  establish_connection :development
end
