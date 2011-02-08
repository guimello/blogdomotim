require 'spec_helper'

describe "admin_roles/edit.html.haml" do
  before(:each) do
    @role = assign(:role, stub_model(Admin::Role,
      :name => "MyString"
    ))
  end

  it "renders the edit role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => role_path(@role), :method => "post" do
      assert_select "input#role_name", :name => "role[name]"
    end
  end
end
