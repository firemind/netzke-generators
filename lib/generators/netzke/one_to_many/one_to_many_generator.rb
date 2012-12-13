class Netzke::OneToManyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :submodel, :type => :string
  class_option :mixin, :type => :boolean, :default => true, :desc => "Generate JS mixin file."

  desc "Generates 2 Grids from 2 Models in one to many relationship"
  def one_to_many
    template('one_to_many.tt', "app/components/#{file_name.underscore}_manager.rb")
    template('one_to_many/javascripts/one_to_many.tt', "app/components/#{file_name.underscore}_manager/javascripts/#{file_name.underscore}_manager.js")
    generate("netzke:grid", "#{file_name.underscore} --#{ 'no' if !options.mixin? }-mixin")
    generate("netzke:grid", "#{submodel.underscore} --#{ 'no' if !options.mixin? }-mixin")
  end

end
