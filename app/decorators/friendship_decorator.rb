class FriendshipDecorator < Draper::Decorator
  delegate_all

  def user_view
     (h.current_user == object.user) ? object.friend : object.user 
  end

  def status_or_buttons
    return buttons if object.pending? && object.user != h.current_user
    return status
  end

  def buttons
      (confirm_button + denegate_button).html_safe
  end

  def confirm_button
    h.link_to "Aceptar", h.friendship_path(object,status:"1"), method: :patch, class: "text-right mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
  end

  def denegate_button
    h.link_to "Denegar", h.friendship_path(object,status: "0"), method: :patch, class: "text-right space mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
  end   

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
