# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  it 'allows to use reserved `type` keyword' do
    expect { History.create(user: 'test@example.com', type: 'created') }.to change(History, :count)
  end
end
