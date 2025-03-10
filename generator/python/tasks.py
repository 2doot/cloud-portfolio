from invoke import task 
from generator.generator import Generator 
from pathlib import Path

@task
def generate(c, clean=False):
  root_path = Path(__file__).parents[2]
  

  template_path = Path(root_path,'generator','python','templates', 'portfolio-project.html.jinja')
  markdown_path = Path(root_path,'generator','markdown', 'website-project.md')
  output_path = Path(root_path,'public','projects', 'multi-cloud-portfolio-website.html')
  Generator.run(
    template_path=template_path,
    markdown_path=markdown_path,
    output_path=output_path
  )