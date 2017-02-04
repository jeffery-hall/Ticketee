require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"

    fill_in "Name", with: "Emacs 25"
    fill_in "Description", with: "An extensible text editor for everyone"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."

    project = Project.find_by(name: "Emacs 25")
    expect(page.current_url).to eq project_url(project)

    title = "Emacs 25 - Projects - Ticketee"
    expect(page).to have_title title
  end
end
