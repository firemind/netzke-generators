class Netzke::FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc "Generates a Form from Model"
  def form
    template('form.tt', "app/components/#{file_name.underscore}_form.rb")
  end
 
end
