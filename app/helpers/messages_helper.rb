module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    options_for_select(User.where.not(:id => current_user.id).map { |user| [user.email, user.id,] }, chosen_recipient.nil? ? nil : chosen_recipient.id)
  end

end
