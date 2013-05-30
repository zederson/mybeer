module ApplicationHelper
  def error_tag(model, attribute)
    if(model.errors.has_key? attribute)
      content_tag :div, model.errors[attribute].first, :class => 'error_message'
    end
  end

  def show_errors_tag(model)

    if(model.errors.any?)
      html = "<div id='error_explanation'>"
      html += "<h2>#{model.errors.count} #{t('errors.error').pluralize} #{t('errors.message')} </h2>"
      html += "<ul>"

      model.errors.full_messages.each do |err|
        html += "<li>#{err}</li>"
      end

      html += "</ul>"
      html += "</div>"
      html.html_safe
    end
  end
end
