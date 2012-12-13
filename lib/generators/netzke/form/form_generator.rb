class Netzke::FormGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :model, :type => :string
 
  desc "Generates a Form from Model"
  def form
    template('form.tt', "app/components/#{model.underscore}_form.rb")
  end
 
end
