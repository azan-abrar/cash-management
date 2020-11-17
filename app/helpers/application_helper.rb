# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    key == 'alert' ? 'danger' : 'success'
  end
end
