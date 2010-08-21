require 'test_helper'

class FormOptionsHelperTest < ActionView::TestCase

  silence_warnings do
    Continent   = Struct.new('Continent', :continent_name, :countries)
    Country     = Struct.new('Country', :country_id, :country_name)
  end

  def test_option_groups_from_collection_for_select_returns_html_safe_string
    assert option_groups_from_collection_for_select(dummy_continents, "countries", "continent_name", "country_id", "country_name", "dk").html_safe?
  end

  def test_grouped_options_for_select_returns_html_safe_string
    assert grouped_options_for_select([["Hats", ["Baseball Cap","Cowboy Hat"]]]).html_safe?
  end

  private

    def dummy_continents
      [ Continent.new("<Africa>", [Country.new("<sa>", "<South Africa>"), Country.new("so", "Somalia")] ),
       Continent.new("Europe", [Country.new("dk", "Denmark"), Country.new("ie", "Ireland")] ) ]
    end

end
