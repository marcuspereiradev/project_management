FactoryBot.define do
  factory :activity do
    activity_name { "Some activity" }
    start_date  { Date.parse('04/05/2021') }
    end_date  { Date.parse('09/05/2021') }
    finished { true | false }
    association :project
  end
end
