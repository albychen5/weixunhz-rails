require 'rails_helper'

RSpec.describe "proposals/index", type: :view do
  before(:each) do
    assign(:proposals, [
      Proposal.create!(
        :name => "Name",
        :info => "MyText",
        :user => nil
      ),
      Proposal.create!(
        :name => "Name",
        :info => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of proposals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
