# frozen_string_literal: true

class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :type, null: false
      t.string :user, null: false
      t.datetime :created_at, null: false, default: 'CURRENT_TIMESTAMP'
    end
  end
end
