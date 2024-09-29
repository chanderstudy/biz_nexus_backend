class AddCountryIdAndColumnsToStates < ActiveRecord::Migration[7.2]
  def change
    # Adding foreign key reference to countries
    add_reference :states, :country, foreign_key: true

    # Adding new columns
    add_column :states, :state_slug, :string
    add_column :states, :population, :string
    add_column :states, :area_land, :string
    add_column :states, :area_density, :string
    add_column :states, :publish, :boolean, default: false
    add_column :states, :video_url, :string
  end
end
