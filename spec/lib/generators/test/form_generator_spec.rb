require 'spec_helper'
require "generator_spec/test_case"

describe Netzke::FormGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(product)

  before(:all) do
    prepare_destination
    run_generator
  end

  specify "form should be created" do
    destination_root.should have_structure {
      directory "app" do
        directory "components" do
          file "product_form.rb" do
            contains "class ProductForm < Netzke::Basepack::Form"
          end
        end
      end
    }
  end

end
