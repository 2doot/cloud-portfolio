require 'redcarpet'

class Generator
  def self.run(template_path:, markdown_path:, output_path:)
    puts template_path
    puts markdown_path
    puts output_path
   
    html = self.markdown_to_html markdown_path
    puts html

    # convert markdown to html
    # render the converted html into a template
  end

  def self.markdown_to_html markdown_path
    file_contents = File.read markdown_path
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    html = markdown.render(file_contents)
    return html 
  end
end 