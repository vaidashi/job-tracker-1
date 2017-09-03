FactoryGirl.define do
  factory :tag do
    sequence(:title) do |n|
      "MyTag#{n}"
    end
    
  end
end
