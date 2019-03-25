module ApplicationHelper
  BASETITLE = "RonRails Accursio18 App"
  
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = ApplicationHelper::BASETITLE   #"Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

