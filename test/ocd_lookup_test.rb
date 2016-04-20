require 'test_helper'
require 'pry'

class OcdLookupTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::OcdLookup::VERSION
  end

  def subject
    @lookup ||= OcdLookup::DivisionId.parse(File.read('test/fixtures/country-au.csv'))
  end

  def test_looking_up_country
    assert_equal 'ocd-division/country:au', subject.find(country: 'Australia')
  end

  def test_looking_up_state
    assert_equal 'ocd-division/country:au/state:nsw', subject.find(state: 'New South Wales')
  end

  def test_looking_up_country_and_state
    assert_equal  'ocd-division/country:au/state:nsw', subject.find(country: 'Australia', state: 'New South Wales')
    assert_equal nil, subject.find(country: 'Canada', state: 'New South Wales')
  end
end
