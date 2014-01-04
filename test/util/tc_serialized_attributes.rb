require 'tc_helper.rb'
class Funk
  include Axlsx::Accessors
  include Axlsx::SerializedAttributes
  serializable_attributes :camel_symbol, :boolean, :integer, :xlnm_namespace

  attr_accessor :camel_symbol, :boolean, :integer, :xlnm_namespace
end

class TestSeralizedAttributes < Test::Unit::TestCase
  def setup
    @object = Funk.new
  end

  def test_camel_symbol
    @object.camel_symbol = :foo_bar
    assert_equal('camelSymbol="fooBar" ', @object.serialized_attributes)
  end

  def test_xlnm_namespace
    @object.xlnm_namespace = '_xlnm.Print_Titles'
    assert_equal('xlnmNamespace="_xlnm.Print_Titles" ', @object.serialized_attributes)
  end
end
