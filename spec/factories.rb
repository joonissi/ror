FactoryBot.define do
  factory :user do
    username { "Pekka" }
    password { "Foobar1" }
    password_confirmation { "Foobar1" }
  end

  factory :brewery do
    name { "anonymous" }
    year { 1941 } 
  end

  factory :style do
    name { "Lager" }
    description { "jee jee" }
  end

  factory :beer do
    name { "anonymous" }
    style
    brewery # olueeseen liittyvä panimo luodaan brewery-tehtaalla
  end



  factory :rating do
    beer # reittaukseen liittyvä olut luodaan beer-tehtaalla
  end
end