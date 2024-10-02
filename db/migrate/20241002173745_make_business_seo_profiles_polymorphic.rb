class MakeBusinessSeoProfilesPolymorphic < ActiveRecord::Migration[7.2]
  def change
    remove_reference :business_seo_profiles, :business_card, index: true, foreign_key: true
    add_reference :business_seo_profiles, :seoprofileable, polymorphic: true, index: true
  end
end
