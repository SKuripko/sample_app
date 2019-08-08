class Hit < DevMaSchema
  self.table_name = "hit"
  belongs_to :order
  belongs_to :channel
  scope :select_listing_columns, -> { select("count(hit.id) as hit, hit.supplier_code, hit.gds_id, hit.book_status, count(hit.book_status) as total_book, hit.pay_status, count(hit.pay_status) as total_pay, hit.provider_name")}

  def self.listing(params)
  	items = 
  	  if params[:channel].present?
  		@hits = Hit.select_listing_columns
  		.select("channel.code as code")
  		.joins(:channel)
  		.where("channel.code = ? AND hit.created_at >= ? and hit.created_at <= ?", params[:channel], params[:date_from] || nil, params[:date_to] || nil)
  		.group("hit.supplier_code, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name, code")
  	  elsif params[:supplier_code].present?
  		 @hits = Hit.select_listing_columns
  		.joins(:channel)
  		.where("hit.supplier_code = ? AND hit.created_at >= ? and hit.created_at <= ?", params[:supplier_code], params[:date_from] || nil, params[:date_to] || nil)
  		.group("hit.supplier_code, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name")
  	  elsif
		params[:provider_name].present?
		@hits = Hit.select_listing_columns
  		.joins(:channel)
  		.where("hit.provider_name = ? AND hit.created_at >= ? and hit.created_at <= ?", params[:provider_name], params[:date_from] || nil, params[:date_to] || nil)
  		.group("hit.supplier_code, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name")
  	  end
#      items = items.limit(50)
      total_hits            = items.sum { |item| item[:hit] }
      total_books           = items.sum { |item| item[:total_book] }
      total_pays            = items.sum { |item| item[:total_pay] }
  	  items = items.map do |item|
  		{
  			#hits = items.sum { |item| item[:total] },
            #pays = items.sum { |item| item[:total_pay] },
            #book = items.sum { |item| item[:total_book] },
  			supplier_code:   item.supplier_code,
  			hit:             item.hit,
  			gds_id:          item.gds_id,
  			book_status:     item.book_status,
  			pay_status:      item.pay_status,
  			provider_name:   item.provider_name,
  			channel:         item.code,
  			total_pay:       item.total_pay,
  			total_book:      item.total_book,
  			book_percent:    (item.total_book.to_f / total_hits.to_f) * 100,
  		  payment_percent: (item.total_pay.to_f / total_pays.to_f) * 100       
        }
      end    
      {
    	items: items,
        total: {
          hits: total_hits,
          pays: total_pays,
          book: total_books,
          total_book_percent:    items.sum { |item| item[:book_percent] },
          total_payment_percent: items.sum { |item| item[:payment_percent] }
        }
      }
	end
end





    # логика из view
#              	<% total_book = 0 %>
#          	<% total_hits = @response.sum {|item| item["total"]} %>
#          	<% total_pays = @response.sum {|item| item["total_pay"]} %>
#          	<% total_book = @response.sum {|item| item["total_book"]} %>
#          	<% book_percent = 0 %>
#          	<% total_book_percent = 0 %>
#          	<% total_payment_percent = 0 %>
#          	<% total_books = 0 %>
#          	<% @hits[:items].each do |item|%>
#          	  <% total = item["total"] %>
#          	  <% supplier_code = item["supplier_code"] %>
#          	  <% gds_id = item["gds_id"] %>
#          	  <% book_status = item["book_status"] %>
#          	  <% pay_status = item["pay_status"] %>
#          	  <% provider_name = item["provider_name"] %>
#          	  <% channel = item["code"] %>
#          	  <% total_book = item["total_book"] %>
#          	  <% total_pay = item["total_pay"] %>
#           	  <% book_percent = (total_book.to_f / total_hits.to_f) * 100 %>
#           	  <% payment_percent = ( total_pay.to_f / total_pays.to_f) * 100 %>
#           	  <% total_book_percent += book_percent %>
#           	  <% total_payment_percent += payment_percent %>
#           	  <% total_books += total_book %>
#           	  <% total_pays += item["total_pay"] %>   