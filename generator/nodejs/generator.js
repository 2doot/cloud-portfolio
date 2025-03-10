const fs = require('fs/promises');
const marked = require('marked');
const ejs = require('ejs');

class Generator {
  static async run(template_path, markdown_path, output_path) {
    const contents_html = await Generator.markdown_to_html(markdown_path);
    const html = await Generator.render_ejs_to_html(template_path, contents_html);
    console.log('html', html);
    await Generator.output_file(output_path, html);
  }

  static async markdown_to_html(markdown_path) {
    const file_contents = await fs.readFile(markdown_path, 'utf8');
    const html = marked.parse(file_contents);
    return html;
  }

  static async render_ejs_to_html(template_path, contents_html) {
    const template = await fs.readFile(template_path, 'utf8');
    const html = ejs.render(template, { contents: contents_html });
    return html;
  }

  static async output_file(output_path, html) {
    await fs.writeFile(output_path, html, 'utf8');
    console.log(`File written to ${output_path}`);
  }
}

exports.Generator = Generator;