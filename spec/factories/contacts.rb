FactoryGirl.define do
  factory :contact do
    full_name "Joel Lindow"
    position "Wrap Up Architect"
    sequence(:email) do |n|
     "JL#{n}@materialize.com"
    end
    company nil
  end
end
