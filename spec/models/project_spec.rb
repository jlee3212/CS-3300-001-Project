require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the description is present" do
      project = Project.new(title: "Title")
      expect(project.valid?).to eq(false)
    end

    
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } } #Creates params objects before running tests
    before(:each) do #Create 3 projects in the database from the params object before each test in "scope tests" context
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do #Will return 3 because 3 projects were created before each test.
      expect(Project.count).to eq(3)
    end
  end
end