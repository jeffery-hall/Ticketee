require "rails_helper"

RSpec.feature  "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project, name: "Emacs 25")
    visit "/"
    click_link "Emacs 25"
    click_link "Edit Project"
  end
  
  scenario "with valid attributes" do
    fill_in "Name", with: "Emacs 26 beta"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Emacs 26 beta"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end
