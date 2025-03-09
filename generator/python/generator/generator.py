import markdown
import jinja2
from pathlib import Path

class Generator:
  @classmethod 
  def run(self,template_path,markdown_path,output_path):
    contents_html = self.markdown_to_html(self, markdown_path)
    html = self.render_jinja_to_html(self,template_path,contents_html)
    self.output_file(self,output_path,html)
    
  def markdown_to_html(self,markdown_path):
    file_contents = Path(markdown_path).read_text()
    html = markdown.markdown(file_contents, extensions=['tables'])
    return html 
  def render_jinja_to_html(self,template_path,contents_html):
    template = Path(template_path).read_text()

    environment = jinja2.Environment()
    jtemplate = environment.from_string(template)
    html = jtemplate.render(contents=contents_html)
    return html
  def output_file(self,output_path,html):
    f = open(output_path, "w")
    f.write(html)
    f.close()
    return None 