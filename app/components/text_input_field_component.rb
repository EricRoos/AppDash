# frozen_string_literal: true

class TextInputFieldComponent < ViewComponent::Base
  def initialize(form:, field:)
    @form = form
    @field = field
  end

end
