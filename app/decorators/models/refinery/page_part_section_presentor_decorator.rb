::Refinery::Pages::PagePartSectionPresenter.class_eval do
  def initialize(page_part)
    super(page_part)
    self.fallback_html = page_part.expanded_body.html_safe if page_part.body
    self.id = convert_title_to_id(page_part.title) if page_part.title
  end
end
