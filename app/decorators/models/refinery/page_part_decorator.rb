::Refinery::PagePart.class_eval do
  # Return the body with all block references substituted in.
  def expanded_body
    # Return cached version if it exists
    return @expanded_body if defined?(@expanded_body)

    # Get list of block references
    block_ids = body.scan(/\{\{\s*(\S+)\s*\}\}/).flatten.uniq

    # Make substitutions
    @expanded_body = body
    unless block_ids.empty?
      # Retrieve content from database
      blocks = ::Refinery::Blocks::Block.select("permatitle, content").where(:permatitle => block_ids)
      blocks.each do |block|
        @expanded_body.gsub! /\{\{\s*#{block.permatitle}\s*\}\}/, block.expanded_content
      end
    end

    @expanded_body
  end
end

