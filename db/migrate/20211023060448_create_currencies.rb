class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :slug
      t.string :symbol
      t.decimal :interest

      t.timestamps
    end
  end
end
