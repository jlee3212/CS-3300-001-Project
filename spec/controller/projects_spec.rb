require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  login_user
  
  context "GET #index" do
    it "returns a success response" do
      get :index #Send a get request to controller.
      # expect(response.success).to eq(true)
      expect(response).to be_success #Expects the response from the get request (call index function) to be a success.
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") } #Create a project before any tests are run.
    it "returns a success response" do
      get :show, params: { id: project } #Send a get request to controller with parameters - id of the "let" created project.
      expect(response).to be_success #Expects the response from the get request (call show function) to be a success.
    end
  end
end