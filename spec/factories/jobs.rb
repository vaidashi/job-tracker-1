FactoryGirl.define do

  factory :job do
    sequence(:title) do |n|
      "BigShot#{n}"
    end
    description "Lots of Responsibility"
    level_of_interest 75
    city "Denver"
    company
    category
  end

end
