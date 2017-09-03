FactoryGirl.define do
  factory :company do
    sequence (:name) do |n|
      "MajorCompany#{n}"
    end
  end
end 
