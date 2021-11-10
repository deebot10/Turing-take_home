require 'rails_helper'

RSpec.describe Subscription do
  describe 'Relationships' do
    it {should belong_to(:customer)}
    it {should have_many(:teas)}
  end
end
