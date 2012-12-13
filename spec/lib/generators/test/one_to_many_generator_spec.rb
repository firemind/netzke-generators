require 'spec_helper'
require "generator_spec/test_case"

describe Netzke::OneToManyGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(product positions)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify "grid should be created with mixin file" do
    destination_root.should have_structure {
      directory "app" do
        directory "components" do
          #file "product_grid.rb" do
            #contains "class ProductGrid < Netzke::Basepack::Grid"
          #end
          #file "position_grid.rb" do
            #contains "class PositionGrid < Netzke::Basepack::Grid"
          #end
          file "product_manager.rb" do
            contains "class ProductManager < Netzke::Base"
          end
          #directory "product_grid" do
            #directory "javascripts" do
              #file "product_grid.js" do
                #contains "{\n}"
              #end
            #end
          #end
          #directory "product_grid" do
            #directory "javascripts" do
              #file "product_grid.js" do
                #contains "{\n}"
              #end
            #end
          #end
          directory "product_manager" do
            directory "javascripts" do
              file "product_manager.js" do
                contains "selectContainerRecord"
              end
            end
          end
        end
      end
    }
  end

end
