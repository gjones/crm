PgSearch.multisearch_options = {
  :using => {
    :tsearch => {:dictionary => "english", :prefix => true},
    :trigram => {},
    :dmetaphone => {:any_word => true, :sort_only => true}
  },
  :ignoring => :accents
}
