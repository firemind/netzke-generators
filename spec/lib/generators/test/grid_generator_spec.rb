require 'spec_helper'
require "generator_spec/test_case"

describe Netzke::GridGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(grid product)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify "grid should be created with mixin file" do
    destination_root.should have_structure {
      directory "app" do
        directory "components" do
          file "product_grid.rb" do
            contains "class ProductGrid < Netzke::Basepack::Grid\n  def configure(c)\n    c.model = \"Product\"\n    c.columns = [\n     :name, \n     :price, \n     :vendor_id, \n    ]\n  end\n\n  js_configure do |c|\n    c.mixin\n  end\n\nend\n"
          end
          directory "product_grid" do
            directory "javascripts" do
              file "product_grid.js" do
                contains "{\n}"
              end
            end
          end
        end
      end
    }
  end

end
