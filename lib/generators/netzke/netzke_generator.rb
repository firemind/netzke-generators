class NetzkeGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :model, :type => :string
  class_option :mixin, :type => :boolean, :default => true, :desc => "Generate JS mixin file."
 
  desc "Generates a Grid from Model"
  def grid
    template('grid.tt', "app/components/#{model.underscore}_grid.rb")
    template('grid/javascripts/grid.tt', "app/components/#{model.underscore}_grid/javascripts/#{model.underscore}_grid.js") if options.mixin?
  end
 
  desc "Generates a Form from Model"
  def form
    template('form.tt', "app/components/#{model.underscore}_form.rb")
  end
 
  desc "Generates 2 Grids from 2 Models in one to many relationship"
  argument :submodel, :type => :string
  def one_to_many
    template('one_to_many.tt', "app/components/#{model.underscore}_manager.rb")
    template('grid.tt', "app/components/#{model.underscore}_grid.rb")
    template('grid/javascripts/grid.tt', "app/components/#{model.underscore}_grid/javascripts/#{model.underscore}_grid.js") if options.mixin?
    template('grid.tt', "app/components/#{submodel.underscore}_grid.rb")
    template('grid/javascripts/grid.tt', "app/components/#{submodel.underscore}_grid/javascripts/#{submodel.underscore}_grid.js") if options.mixin?
  end

end
