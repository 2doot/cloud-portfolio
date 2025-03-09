require 'erb'
require 'redcarpet'
require 'fileutils'

# This is a singleton class where it will allow me to reference values passed to my erb template 
class Namespace
  def initialize(hash)
    hash.each do |key, value|
      singleton_class.send(:define_method, key) { value }
    end 
  end

  def get_binding
    binding
  end
end

class Generator
  def self.run(template_path:, markdown_path:, output_path:)
    contents_html = self.markdown_to_html markdown_path
    html = self.render_erb_to_html template_path, contents_html
    self.ouput_file output_path, html 
  end

  def self.markdown_to_html markdown_path
    file_contents = File.read markdown_path
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    html = markdown.render(file_contents)
    return html 
  end

  def self.render_erb_to_html template_path, contents_html
    template= File.read template_path
    ns = Namespace.new(
      contents: contents_html
      )
    html = ERB.new(template).result(ns.get_binding)
    return html 
  end

  def self.ouput_file output_path, html
    # make sure our path exists before writing...
    FileUtils.mkdir_p File.dirname(output_path)

    File.open(output_path, 'w'){|f| f.write(html) }
    
  end

end 