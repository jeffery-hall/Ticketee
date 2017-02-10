require "rails_helper"

RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: "Emacs 25")

    visit "/"
    click_link "Emacs 25"
    expect(page.current_url).to eq project_url(project)
  end
end
