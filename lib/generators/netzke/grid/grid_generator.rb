class Netzke::GridGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  class_option :mixin, :type => :boolean, :default => true, :desc => "Generate JS mixin file."
 
  desc "Generates a Grid from Model"
  def grid
    template('grid.tt', "app/components/#{file_name.underscore}_grid.rb")
    template('grid/javascripts/grid.tt', "app/components/#{file_name.underscore}_grid/javascripts/#{file_name.underscore}_grid.js") if options.mixin?
  end

end
