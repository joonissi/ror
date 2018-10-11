class Weather < OpenStruct
  def self.rendered_fields
    [:temp_c, :temp_f, :is_day, :condition, :wind_kph, :wind_degree, :wind_dir, :cloud ]
  end  
end