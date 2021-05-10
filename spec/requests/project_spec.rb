require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    it 'should return a successful response' do
      get projects_path

      expect(response).to have_http_status(:ok)
      expect(response).to be_successful
    end

    it 'should render the index template' do
      get projects_path

      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
    end

    it "request list of all projects" do
      project = create(:project)
      get projects_path

      expect(response).to be_successful
      expect(response.body).to include("Some project")
    end
  end
end
