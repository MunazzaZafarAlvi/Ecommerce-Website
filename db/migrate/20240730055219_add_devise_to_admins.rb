class AddDeviseToAdmins < ActiveRecord::Migration[7.1]
  def self.up
    change_table :admins, bulk: true do |t|
      ## Database authenticatable
      t.string :email, null: false, default: "" unless column_exists?(:admins, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:admins, :encrypted_password)

      ## Recoverable
      t.string :reset_password_token unless column_exists?(:admins, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:admins, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:admins, :remember_created_at)

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:admins, :sign_in_count)
      # t.datetime :current_sign_in_at unless column_exists?(:admins, :current_sign_in_at)
      # t.datetime :last_sign_in_at unless column_exists?(:admins, :last_sign_in_at)
      # t.string   :current_sign_in_ip unless column_exists?(:admins, :current_sign_in_ip)
      # t.string   :last_sign_in_ip unless column_exists?(:admins, :last_sign_in_ip)

      ## Confirmable
      # t.string   :confirmation_token unless column_exists?(:admins, :confirmation_token)
      # t.datetime :confirmed_at unless column_exists?(:admins, :confirmed_at)
      # t.datetime :confirmation_sent_at unless column_exists?(:admins, :confirmation_sent_at)
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:admins, :failed_attempts)
      # t.string   :unlock_token unless column_exists?(:admins, :unlock_token)
      # t.datetime :locked_at unless column_exists?(:admins, :locked_at)

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :admins, :email, unique: true unless index_exists?(:admins, :email)
    # add_index :admins, :reset_password_token, unique: true unless index_exists?(:admins, :reset_password_token)
    # add_index :admins, :confirmation_token, unique: true unless index_exists?(:admins, :confirmation_token)
    # add_index :admins, :unlock_token, unique: true unless index_exists?(:admins, :unlock_token)
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
