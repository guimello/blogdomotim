require 'spec_helper'

describe "admin_roles/index.html.haml" do
  before(:each) do
    assign(:admin_roles, [
      stub_model(Admin::Role,
        :name => "Name"
      ),
      stub_model(Admin::Role,
        :name => "Name"
      )
    ])
  end

  it "renders a list of admin_roles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
