# -*- ruby -*-

require 'rubygems'
require 'hoe'
# require './lib/good_form_builder.rb'

Hoe.new('good_form_builder', "0.0.1") do |p|
  p.developer('Geoffrey Grosenbach', 'boss@topfunky.com')
end

namespace :build do

  desc "Generate static CSS from Sass template"
  task :css do
    require 'sass'

    good_form_generator_template_dir = "./generators/good_form_builder/templates/"
    File.open("#{good_form_generator_template_dir}/good_form.sass", 'r') do |inf|
      File.open("#{good_form_generator_template_dir}/good_form.css", 'w') do |outf|
        outf.write Sass::Engine.new(inf.read).to_css
      end
    end
  end

  desc "Generate HTML example"
  task :html do
    require 'active_support'
    require 'action_view'
    require 'action_controller'
    require './lib/good_form_builder'

    include ActionView::Helpers
    include ActionController::PolymorphicRoutes
    
    ###
    # HACK Stub methods for rendering
    class ModelStub
      def title; ""; end
      def author; ""; end
      def department; ""; end
    end
    def polymorphic_path(options); '/'; end
    def protect_against_forgery?; false; end
    $buffer_string = ''
    def output_buffer; $buffer_string; end
    def output_buffer=(buf); $buffer_string = buf; end
    ###
    
    require 'haml'

    File.open("examples/index.html.haml", 'r') do |inf|
      File.open("examples/index.html", 'w') do |outf|
        outf.write Haml::Engine.new(inf.read).to_html
      end
    end
  end

end
