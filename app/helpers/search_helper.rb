module SearchHelper
  def exec_link_for(termine, ricerca)
    if termine.size == 1
      content_tag(:strong, "Termine troppo corto")
    else
      hint = content_tag(:span, "ricerca per: #{termine}!", class: 'scarcity')
      link_to "ESEGUI! #{hint}".html_safe, filtered_lpublishers_path(ricerca), class: 'button ok register'
    end
  end

  def detailed_link_to_show_search(search)
  	link_to "mostra #{search.id.to_s} #{search.argomento}", search
  end # def detailed_link_to_show_search

  def detailed_link_to_exec_search(search)
  	link_to "esegue #{search.id.to_s} #{search.argomento}", eseric_path(search)
  end # def detailed_link_to_exec_search
end
