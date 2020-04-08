# frozen_string_literal: true

module CXML
  class PunchOutOrderMessage < DocumentNode
    accessible_nodes %i[
      buyer_cookie
      punch_out_order_message_header
      items_in
    ]

    def initialize_item_in(value)
      @items_in = value.map do |item|
        CXML::ItemIn.new(item)
      end
    end

    def initialize_items_in(value)
      @items_in = value.map do |item|
        CXML::ItemIn.new(item)
      end
    end

    def add_item(item_in_data)
      items_in << CXML::ItemIn.new(item_in_data)
    end
  end
end
