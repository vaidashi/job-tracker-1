FactoryGirl.define do
  factory :category do
    sequence (:title) do |n|
     "Marketing#{n}"
   end 
  end
end
