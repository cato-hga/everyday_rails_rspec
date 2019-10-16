FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "A test project."
    due_on 1.week.from_now
    association :owner
  end
    trait :with_notes do
      #Callbacks let you perform additional actions on a factory-generated object before it is created, or after it is created, built, or stubbed.
      after(:create) { |project| create_list(:note, 5, project: project) }
    end
    trait :due_yesterday do 
      due_on 1.day.ago
    end

    trait :due_today do
      due_on Date.current.in_time_zone
    end

    trait :due_tomorrow do
      due_on 1.day.from_now
    end
end
