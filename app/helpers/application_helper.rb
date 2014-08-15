module ApplicationHelper

  def link_to_remove_fields(name, f, target = 'this')
    anchor_text = content_tag :i, name,  class: 'icon-trash'
    f.hidden_field(:_destroy) + link_to_function(raw(anchor_text), "remove_fields(#{target})", class: 'btn btn-danger')
  end

  def link_to_add_fields(name, f, association, target = 'this')
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    anchor_text = content_tag :i, name, class: 'icon-plus'
    link_to_function(anchor_text, "add_fields(#{target}, \"#{association}\", \"#{escape_javascript(fields)}\")", class: 'btn btn-success')
  end

  # Because handling nil dates for `@object.repaired_at, format: :short`
  # is annoying
  def local_date(date, options = {})
    localize(date.to_date, options) unless date.blank?
  end

end
