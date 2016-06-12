class AddProposalRefToGroup < ActiveRecord::Migration
  def change
  	add_reference :proposals, :group, index: true
  end
end
