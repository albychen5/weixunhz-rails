require 'rails_helper'

RSpec.describe "proposals/edit", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      :name => "MyString",
      :info => "MyText",
      :user => nil
    ))
  end

  it "renders the edit proposal form" do
    render

    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do

      assert_select "input#proposal_name[name=?]", "proposal[name]"

      assert_select "textarea#proposal_info[name=?]", "proposal[info]"

      assert_select "input#proposal_user_id[name=?]", "proposal[user_id]"
    end
  end
end
