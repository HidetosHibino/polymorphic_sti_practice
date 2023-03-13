require 'rails_helper'

RSpec.describe "words/show", type: :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
