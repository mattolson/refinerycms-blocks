::Refinery::Page.class_eval do
  # Modified to return content with all blocks expanded.
  def content_for(part_title)
    part_with_title(part_title).try(:expanded_body)
  end
end

