require "rails_helper"

RSpec.describe "notes/new" do

  it "does not render a different template" do
    expect(view).to_not render_template("notes/new")
  end
end