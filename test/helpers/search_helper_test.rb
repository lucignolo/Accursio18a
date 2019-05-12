require 'test_helper'

class SearchHelperTest < ActionView::TestCase
   test "aspetto corretto del detailed link a show search" do
      search = searches(:sea21)
      assert_dom_equal %{<a href="/searches/#{search.id}">mostra 21 editor</a>}, detailed_link_to_show_search(search)
   end # test do

   test "aspetto corretto del detailed link a execute search" do
      search = searches(:sea21)
      assert_dom_equal %{<a href="/searches/#{search.id}/esegui">esegue 21 editor</a>}, detailed_link_to_exec_search(search)
   end # test do 
end   # class
