class AddRestiTo<%= table_name.camelize %> < ActiveRecord::Migration
  def up
    change_table :<%= table_name %> do |t|
      t.string   :payer_id
      t.datetime :payment_created_at
      t.datetime :payment_updated_at

      # t.timestamps # Uncomment if timestamps were not included in your original model.
    end

    add_index :<%= table_name %>, :payer_id
  end

  def down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
