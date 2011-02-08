require "spec_helper"

describe Admin::RolesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin_roles" }.should route_to(:controller => "admin_roles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin_roles/new" }.should route_to(:controller => "admin_roles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_roles/1" }.should route_to(:controller => "admin_roles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_roles/1/edit" }.should route_to(:controller => "admin_roles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_roles" }.should route_to(:controller => "admin_roles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin_roles/1" }.should route_to(:controller => "admin_roles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_roles/1" }.should route_to(:controller => "admin_roles", :action => "destroy", :id => "1")
    end

  end
end
