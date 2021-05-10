require 'rails_helper'

RSpec.describe Project, type: :model do
  context "Associations" do
    it { should have_many :activities }
  end

  context "Validations" do
    it { should validate_presence_of :project_name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }

    it "should create an instance of Project" do
      project = build(:project)
      expect(project).to be_instance_of(Project)
    end

    it "should not be blank attributes" do
      project = Project.new

      project.valid?

      expect(project.errors[:project_name]).to include("não pode ficar em branco")
      expect(project.errors[:start_date]).to include("não pode ficar em branco")
      expect(project.errors[:end_date]).to include("não pode ficar em branco")
    end

    it "should be valid with valid attributes" do
      project = build(:project)

      expect(project.class).to eq Project
      expect(project.project_name).to eq "Some project"
      expect(project.start_date).to eq Date.parse("04/05/2021")
      expect(project.end_date).to eq Date.parse("09/05/2021")
      expect(project).to be_valid
    end
  end
end
