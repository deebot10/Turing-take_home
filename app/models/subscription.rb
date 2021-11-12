class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, 
                        :price, 
                        :status, 
                        :frequency, 
                        :customer_id, 
                        :tea_id

  enum status: { :subscribed => 0, :cancelled => 1, :pause => 2}
  enum frequency: { :monthly => 0, :weekly => 1}
end
