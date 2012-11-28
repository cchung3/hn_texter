module LayoutHelper
  
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    content_for(:title_for_page) { h(page_title.to_s + " | Hacker News Texter")}
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end

end