class CreateJoinTableBusinessCardsServices < ActiveRecord::Migration[7.2]
  def change
    create_join_table :business_cards, :services do |t|
      t.index [:business_card_id, :service_id], unique: true, name: 'index_business_cards_services_on_card_id_and_service_id'
      t.index [:service_id, :business_card_id], name: 'index_services_business_cards_on_service_id_and_card_id'
    end
  end
end
