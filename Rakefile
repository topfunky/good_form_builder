# -*- ruby -*-

require 'rubygems'
require 'hoe'
# require './lib/good_form_builder.rb'

Hoe.new('good_form_builder', "0.0.1") do |p|
  # p.rubyforge_name = 'GoodFormx' # if different than lowercase project name
  p.developer('Geoffrey Grosenbach', 'boss@topfunky.com')
end

desc "Generate static CSS from Sass template"
task :build_css do
  require 'sass'

  good_form_generator_template_dir = "./generators/good_form_builder/templates/"
  File.open("#{good_form_generator_template_dir}/good_form.sass", 'r') do |inf|
    File.open("#{good_form_generator_template_dir}/good_form.css", 'w') do |outf|
      outf.write Sass::Engine.new(inf.read).to_css
    end
  end

end

