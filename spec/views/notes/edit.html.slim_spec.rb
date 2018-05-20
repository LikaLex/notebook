require "rails_helper"

RSpec.describe "notes/edit" do

  it "does not render a different template" do
    expect(view).to_not render_template("notes/edit")
  end
end