class RemoveSubscriptionIdFromTea < ActiveRecord::Migration[5.2]
  def change
    remove_column :teas, :subscription_id, :bigint
  end
end
