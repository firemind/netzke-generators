class Netzke::GridGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :model, :type => :string
  class_option :mixin, :type => :boolean, :default => true, :desc => "Generate JS mixin file."
 
  desc "Generates a Grid from Model"
  def grid
    template('grid.tt', "app/components/#{model.underscore}_grid.rb")
    template('grid/javascripts/grid.tt', "app/components/#{model.underscore}_grid/javascripts/#{model.underscore}_grid.js") if options.mixin?
  end

end
