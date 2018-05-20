require "rails_helper"

RSpec.describe "welkome/index" do

  it "does not render a different template" do
    expect(view).to_not render_template("welkome/index")
  end
end