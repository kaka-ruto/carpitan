module LegislationsHelper
  def filter_button(form, filter, count)
    form.button class: "btn btn-link #{(params[:filter] == filter) ? "active" : ""}", name: "filter", value: filter do
      content_tag(:span, filter, class: "badge #{(params[:filter] == filter) ? "bg-primary" : "bg-secondary"}") +
        content_tag(:span, count, class: "ms-1")
    end
  end
end
