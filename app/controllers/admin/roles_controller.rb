class Admin::RolesController < InheritedResources::Base
  respond_to :html
  
  def create
    create! :notice => I18n.t(:notice,  :scope => [:flash, :actions, :create], :resource => Admin::Role.model_name.human),
            :alert  => I18n.t(:alert,   :scope => [:flash, :actions, :create], :resource => Admin::Role.model_name.human)
  end

  def update
    update! :notice => I18n.t(:notice,  :scope => [:flash, :actions, :update], :resource => Admin::Role.model_name.human),
            :alert  => I18n.t(:alert,   :scope => [:flash, :actions, :update], :resource => Admin::Role.model_name.human)
  end

  def destroy
    destroy! :notice => I18n.t(:notice,  :scope => [:flash, :actions, :destroy], :resource => Admin::Role.model_name.human),
            :alert  => I18n.t(:alert,   :scope => [:flash, :actions, :destroy], :resource => Admin::Role.model_name.human)
  end
end
