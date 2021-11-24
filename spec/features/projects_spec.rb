require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do #Visit the new project URL and enter "Test Title" into the Title form before running all tests in the "Create new project" context.
      user  = FactoryBot.create(:user)
      login_as(user)
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description" #Enters data into a form.
      click_button "Create Project" #Clicks on a button that matches the search "Create Project"
      expect(page).to have_content("Project was successfully created") #Expect the page to have text. The test fails if it doesn't.
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      user  = FactoryBot.create(:user)
      login_as(user)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    before(:each) do
      user  = FactoryBot.create(:user)
      login_as(user)
    end
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0) #Expect no projects to be in the DB once this test is run. Fail if any exist.
    end
  end
end