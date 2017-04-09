class SearchController < ApplicationController

  def index
    @pg_search_documents = Contact.search_by_full_name(params[:query])
  end

end
