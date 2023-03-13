require 'rails_helper'

RSpec.describe "words/index", type: :view do
  before(:each) do
    assign(:words, [
      Word.create!(
        name: "Name"
      ),
      Word.create!(
        name: "Name"
      )
    ])
  end

  # it "renders a list of words" do
  #   render
  #   assert_select "tr>td", text: "Name".to_s, count: 2
  # end
end
