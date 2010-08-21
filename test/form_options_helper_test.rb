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

  def test_grouped_options_for_select_with_script_tags_still_returns_html_safe_string
    assert grouped_options_for_select([["<script>some</script>", ["<script>evil<script>","<script>code!</script>"]]]).html_safe?
  end

  def test_grouped_options_for_select_prompt_is_escaped
    grouped_options_result = grouped_options_for_select(grouped_options_sample_data, 'Europe', 'Some unescaped <script>text.</script>')
    assert !grouped_options_result.match(/<script>/)
  end

  private

    def dummy_continents
      [ Continent.new("<Africa>", [Country.new("<sa>", "<South Africa>"), Country.new("so", "Somalia")] ),
       Continent.new("Europe", [Country.new("dk", "Denmark"), Country.new("ie", "Ireland")] ) ]
    end

    def grouped_options_sample_data
      [ ['North America', [['United States','US'],'Canada']],
        ['Europe', ['Denmark','Germany','France']]]
    end

end
