################################################################################
# Method for accessing helper methods outside of views. Sample usage:
#   helpers.image_tag('icons/asc.png')
def helpers
  ActionController::Base.helpers
end
