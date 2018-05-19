require "rails_helper"

RSpec.describe "notes/show" do

  it "does not render a different template" do
    expect(view).to_not render_template("notes/show")
  end
end



