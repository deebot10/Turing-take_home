require 'rails_helper'

RSpec.describe 'Subscription Api' do 
  before(:each) do
    @dee = Customer.create(first_name: 'Dee', last_name: 'Hill', email: 'dee@aol.com', address: '123')

    @tea1 = Tea.create(title: 'Earl Grey Lavender', description: 'Earl grey with a dab of lavender', temperature: 185, brew_time: 2.5)
    @tea2 = Tea.create(title: 'Matcha', description: 'Good and Green', temperature: 175, brew_time: 3.5)
    @tea3 = Tea.create(title: 'Old English', description: 'Bitter', temperature: 160, brew_time: 2.0)
  end

  describe 'Create Subscription' do
    it 'can create a subscription' do
      subscribe = {
        title: 'Tea Time',
        price: '4.00',
        status: 0,
        frequency: 0,
        customer_id: @dee.id,
        tea_id: @tea1.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json'}

      post '/api/v1/subscriptions', headers: headers, params: JSON.generate(subscribe)
      
      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json.class).to eq(Hash)
      expect(json[:data][:attributes][:title].class).to eq(String)
      expect(json[:data][:attributes][:status].class).to eq(String)
      expect(json[:data][:attributes][:frequency].class).to eq(String)
    end
  end

  describe 'Update Subscription' do
    it 'can update the status on a sub' do
      subs = Subscription.create!(title: 'Tea Time', price: '4.00', status: 0, frequency: 0, customer_id: @dee.id, tea_id: @tea1.id)  
      update_sub = {status: 0}

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json'}
      
      patch "/api/v1/subscriptions/#{subs.id}", headers: headers, params: JSON.generate(update_sub)

      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)
    end
  end

  describe 'User Subscription Index' do
    it 'displays all user subscriptions' do
      subs1 = Subscription.create!(title: 'Tea Time', price: '4.00', status: 0, frequency: 0, customer_id: @dee.id, tea_id: @tea1.id)  
      subs2 = Subscription.create!(title: 'Matcha Party', price: '2.00', status: 1, frequency: 1, customer_id: @dee.id, tea_id: @tea2.id)  
      subs3 = Subscription.create!(title: 'Ol English Festival', price: '5.00', status: 2, frequency: 0, customer_id: @dee.id, tea_id: @tea3.id)  
      
      get "/api/v1/customers/#{@dee.id}/subscriptions"
      expect(response.status).to eq(200) 

      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json.class).to eq(Hash)
      expect(json[:data].class).to eq(Array)
      expect(json[:data][0].class).to eq(Hash)
      expect(json[:data][0][:attributes][:title]).to eq('Tea Time')
    end
  end  
end