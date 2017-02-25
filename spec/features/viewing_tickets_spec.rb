require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    author = FactoryGirl.create(:user)
    
    emacs = FactoryGirl.create(:project, name: "Emacs 25")
    FactoryGirl.create(:ticket, project: emacs, author: author, name: "Make it shiny!", description: "Webkit, and espresso maker.")

    ie = FactoryGirl.create(:project, name: "Internet Exploder")
    FactoryGirl.create(:ticket, project: ie, author: author, name: "Standards compliance", description: "Isn't a joke.")

    visit "/"
  end

  scenario "for a given project" do
    click_link "Emacs 25"

    expect(page).to have_content "Make it shiny!"
    expect(page).to_not have_content "Standards compliance"

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content "Make it shiny!"
    end

    expect(page).to have_content "Webkit, and espresso maker."
  end
end
