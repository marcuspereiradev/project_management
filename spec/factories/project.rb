FactoryBot.define do
  factory :project do
    project_name { "Some project" }
    start_date  { Date.parse('04/05/2021') }
    end_date  { Date.parse('09/05/2021') }
  end
end
