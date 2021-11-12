require 'rails_helper'

RSpec.describe 'Customer Api' do 
   before(:each) do
    @dee = Customer.create(first_name: 'Dee', last_name: 'Hill', email: 'dee@aol.com', address: '123')
    @ch = Customer.create(first_name: 'Chantele', last_name: 'Sean', email: 'ch@aol.com', address: '222')
    @kris = Customer.create(first_name: 'Kris', last_name: 'Middleton', email: 'bigK@aol.com', address: '321')

    @tea = Tea.create(title: 'Earl Grey Lavender', description: 'Earl grey with a dab of lavender', temperature: 185, brew_time: 2.5)
  end

  describe 'display a customer' do
    it 'Customer show' do

      get "/api/v1/customers/#{@dee.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)
     
      expect(json.class).to eq(Hash)
      expect(json[:data][:attributes][:first_name].class).to eq(String)
      expect(json[:data][:attributes][:email].class).to eq(String)
      expect(json[:data][:attributes][:address].class).to eq(String)
    end
  end
end