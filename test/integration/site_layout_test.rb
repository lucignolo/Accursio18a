require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get eseric_path(21)
    assert_template 'searches/eseguiRicerca'
    #assert_select "a[href=?]", root_path, count: 2
    #assert_select "a[href=?]", help_path
    #assert_select "a[href=?]", about_path
    #assert_select "a[href=?]", contact_path
  end
end
