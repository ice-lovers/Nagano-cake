class ChangeIsDeletedOfCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_deleted, from: true, to: false
  end
end
