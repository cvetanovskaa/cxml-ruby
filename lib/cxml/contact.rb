# frozen_string_literal: true

module CXML
  # contact object within punchout setup request
  class Contact < DocumentNode
    accessible_attributes %i[
      role
    ]
    accessible_nodes %i[
      email
      name
    ]
  end
end
