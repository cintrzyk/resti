class RestiCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table :<%= table_name %> do |t|
      t.string   :payer_id
      t.datetime :payment_created_at
      t.datetime :payment_updated_at
    end

    add_index :<%= table_name %>, :payer_id
  end
end
