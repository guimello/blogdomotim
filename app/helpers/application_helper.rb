module ApplicationHelper
  def load_more(collection = [])
    raise 'cannot load_more using this collection' if !collection.respond_to?(:num_pages) || !collection.respond_to?(:current_page)

    content_tag :div, :class => 'load-more-collection-container' do
      link_to 'mais', {:page => collection.current_page + 1, :per => params[:per]}, :class => 'load-more-collection' if collection.num_pages > collection.current_page
    end
  end
end
