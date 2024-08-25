# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

file_path = Rails.root.join('web_state.csv')

CSV.foreach(file_path, headers: true) do |row|
  State.find_or_create_by(state_id: row['state_id']) do |state|
    state.state_type = row['state_type']
    state.state_name = row['state_name']
    state.state_hq = row['state_hq']
    state.state_cd = row['state_cd']
    state.state_detail = row['state_detail']
    state.state_logi = row['state_logi']
    state.state_lati = row['state_lati']
    state.state_reach_img = row['state_reach_img']
    state.state_map = row['state_map']
    state.estd_dd = row['estd_dd']
    state.estd_mm = row['estd_mm']
    state.estd_yy = row['estd_yy']
    state.state_web = row['state_web']
    state.state_lang1 = row['state_lang1']
    state.state_lang2 = row['state_lang2']
    state.state_seo_kword = row['state_seo_kword']
    state.state_seo_mtag = row['state_seo_mtag']
    state.state_seo_data = row['state_seo_data']
    state.state_p_status = row['state_p_status']
    state.state_status = row['state_status']
    state.state_dist = row['state_dist']
  end
end

file_path = Rails.root.join('web_dist.csv')

CSV.foreach(file_path, headers: true) do |row|
  District.find_or_create_by(dist_id: row['dist_id']) do |district|
    district.state_id = row['state_id']
    district.dist_cd = row['dist_cd']
    district.dist_name = row['dist_name']
    district.dist_hq = row['dist_hq']
    district.dist_detail = row['dist_detail']
    district.dist_pop11 = row['dist_pop11']
    district.dist_area = row['dist_area']
    district.dist_density = row['dist_density']
    district.dist_web = row['dist_web']
    district.dist_lang1 = row['dist_lang1']
    district.dist_lang2 = row['dist_lang2']
    district.dist_logi = row['dist_logi']
    district.dist_lati = row['dist_lati']
    district.dist_reach_img = row['dist_reach_img']
    district.dist_map = row['dist_map']
    district.estd_dd = row['estd_dd']
    district.estd_mm = row['estd_mm']
    district.estd_yy = row['estd_yy']
    district.dist_seo_kword = row['dist_seo_kword']
    district.dist_seo_mtag = row['dist_seo_mtag']
    district.dist_seo_data = row['dist_seo_data']
    district.dist_block = row['dist_block']
    district.dist_sdist = row['dist_sdist']
    district.dist_p_status = row['dist_p_status']
    district.dist_status = row['dist_status']
  end
end

file_path = Rails.root.join('web_city.csv')

CSV.foreach(file_path, headers: true) do |row|
  # Find or initialize the district and state
  district = District.find_by(dist_id: row['dist_id'])
  state = State.find_by(state_id: row['state_id'])

  if district.nil?
    puts "Skipping City with city_id: #{row['city_id']}. District with dist_id: #{row['dist_id']} does not exist."
    next
  end

  if state.nil?
    puts "Skipping City with city_id: #{row['city_id']}. State with state_id: #{row['state_id']} does not exist."
    next
  end

  # Create or update the city record
  city = City.new(
    city_id: row['city_id'],
    dist_id: district.id,
    state_id: row['state_id'],
    city_name: row['city_name'],
    city_detail: row['city_detail'],
    city_lang1: row['city_lang1'],
    city_lang2: row['city_lang2'],
    city_logi: row['city_logi'],
    city_lati: row['city_lati'],
    city_reach_img: row['city_reach_img'],
    city_map: row['city_map'],
    city_seo_kword: row['city_seo_kword'],
    city_seo_mtag: row['city_seo_mtag'],
    city_seo_data: row['city_seo_data'],
    city_pop11: row['city_pop11'],
    city_area: row['city_area'],
    city_density: row['city_density'],
    city_star: row['city_star'],
    city_type: row['city_type'],
    city_tier: row['city_tier'],
    city_smart: row['city_smart'],
    crime_level: row['crime_level'],
    sdist_id: row['sdist_id'],
    city_p_status: row['city_p_status'],
    city_status: row['city_status']
  )

  if city.save
    puts "City with city_id: #{row['city_id']} was successfully created."
  else
    debugger
    puts "Failed to create City with city_id: #{row['city_id']}. Errors: #{city.errors.full_messages.join(', ')}"
  end
end


file_path = Rails.root.join('web_area.csv')

CSV.foreach(file_path, headers: true) do |row|
  # Find or initialize the city, district, and state
  city = City.find_by(city_id: row['city_id'])
  district = District.find_by(dist_id: row['dist_id'])
  state = State.find_by(state_id: row['state_id'])

  if city.nil?
    puts "Skipping Area with area_id: #{row['area_id']}. City with city_id: #{row['city_id']} does not exist."
    next
  end

  if district.nil?
    puts "Skipping Area with area_id: #{row['area_id']}. District with dist_id: #{row['dist_id']} does not exist."
    next
  end

  if state.nil?
    puts "Skipping Area with area_id: #{row['area_id']}. State with state_id: #{row['state_id']} does not exist."
    next
  end

  # Create or update the area record
  area = Area.find_or_initialize_by(area_id: row['area_id'])
  area.assign_attributes(
    city_id: city.id,
    dist_id: district.id,
    state_id: state.id,
    area_name: row['area_name'],
    area_detail: row['area_detail'],
    area_reach_img: row['area_reach_img'],
    area_map: row['area_map'],
    area_star: row['area_star'],
    crime_level: row['crime_level'],
    area_status: row['area_status'],
    area_logi: row['area_logi'],
    area_lati: row['area_lati'],
    area_type: row['area_type'],
    area_pin: row['area_pin'],
    area_seo_kword: row['area_seo_kword'],
    area_seo_mtag: row['area_seo_mtag'],
    area_seo_data: row['area_seo_data'],
    area_p_status: row['area_p_status']
  )

  if area.save
    puts "Area with area_id: #{row['area_id']} was successfully created or updated."
  else
    puts "Failed to create or update Area with area_id: #{row['area_id']}. Errors: #{area.errors.full_messages.join(', ')}"
  end
end
