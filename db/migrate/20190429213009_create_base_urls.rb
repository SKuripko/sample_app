# frozen_string_literal: true

class CreateBaseUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :base_urls do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
