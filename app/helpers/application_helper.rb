# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def full_title(page_title = '')
    base_title = 'ミニブログ'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def nav_link(text, path, method: :get)
    options = { class: current_page?(path) ? 'nav-item active' : 'nav-item' }
    tag.li(:li, options) do
      link_to text, path, class: 'nav-link', method: method
    end
  end
end
