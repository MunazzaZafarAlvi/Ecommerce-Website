class RenameTypeInPayments < ActiveRecord::Migration[7.1]
  def change
    rename_column :payments, :type, :payment_type
  end
end
