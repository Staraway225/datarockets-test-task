# frozen_string_literal: true

class History < ApplicationRecord
  self.inheritance_column = nil
  validates :user, :type, presence: true
end
