class GoodFormBuilderGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      stylesheets_dir = File.join("public", "stylesheets")
      sass_dir        = File.join(stylesheets_dir, "sass")

      m.directory stylesheets_dir
      m.directory sass_dir
      
      m.file "good_form.sass", File.join(sass_dir, "good_form.sass")
      m.file "good_form.css",  File.join(stylesheets_dir, "good_form.css")
    end
  end
end
