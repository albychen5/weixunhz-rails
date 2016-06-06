require 'rails_helper'

RSpec.describe "proposals/new", type: :view do
  before(:each) do
    assign(:proposal, Proposal.new(
      :name => "MyString",
      :info => "MyText",
      :user => nil
    ))
  end

  it "renders new proposal form" do
    render

    assert_select "form[action=?][method=?]", proposals_path, "post" do

      assert_select "input#proposal_name[name=?]", "proposal[name]"

      assert_select "textarea#proposal_info[name=?]", "proposal[info]"

      assert_select "input#proposal_user_id[name=?]", "proposal[user_id]"
    end
  end
end
