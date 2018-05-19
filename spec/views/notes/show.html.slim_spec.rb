require 'spec_helper'

RSpec.describe Note, :type => :view do
  it 'displays note details correctly' do
    assign(:note, Note.create(name: 'Shirt', content: 'Some content'))

    render

    rendered.should contain('Shirt')
    rendered.should contain('Some content')
  end
end