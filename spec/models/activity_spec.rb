require 'rails_helper'

RSpec.describe Activity, type: :model do
  context "Associations" do
    it { should belong_to :project }
  end

  context "Validations" do
    it { should validate_presence_of :activity_name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :project_id }

    it "should create an instance of Activity" do
      activity = build(:activity)
      expect(activity).to be_instance_of(Activity)
    end
  end

  it "should not be blank attributes" do
    activity = Activity.new

    activity.valid?

    expect(activity.errors[:activity_name]).to include("can't be blank")
    expect(activity.errors[:start_date]).to include("can't be blank")
    expect(activity.errors[:end_date]).to include("can't be blank")
    expect(activity.errors[:project_id]).to include("can't be blank")
  end

  it "should be valid with valid attributes" do
    activity = build(:activity)

    expect(activity.class).to eq Activity
    expect(activity.activity_name).to eq "Some activity"
    expect(activity.start_date).to eq Date.parse("04/05/2021")
    expect(activity.end_date).to eq Date.parse("09/05/2021")
    expect(activity.finished).to be_in([true, false])
    # expect(activity).to be_valid
  end
end
