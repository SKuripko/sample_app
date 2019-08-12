# frozen_string_literal: true

class Hit < DevMaSchema
  self.table_name = 'hit'
  belongs_to :order
  belongs_to :channel
  scope :select_listing_columns, -> { select('count(hit.id) as hit, hit.supplier_code, hit.gds_id, hit.book_status, count(hit.book_status) as total_book, hit.pay_status, count(hit.pay_status) as total_pay, hit.provider_name, channel.code as code').joins(:channel) }

  def self.listing(params)
    items = select_listing_columns
    items = items.where('channel.code  = ?', params[:channel]) if params[:channel].present?
    items = items.where('hit.created_at >= ?', params[:date_from]) if params[:date_from].present?
    items = items.where('hit.created_at <= ?', params[:date_to]) if params[:date_to].present?
    items = items.where('hit.supplier_code = ?', params[:supplier_code]) if params[:supplier_code].present?
    items = items.where('hit.provider_name = ?', params[:provider_name]) if params[:provider_name].present?
    items = items.group('hit.supplier_code, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name, code')

    total_hits            = items.sum { |item| item[:hit] }
    total_books           = items.sum { |item| item[:total_book] }
    total_pays            = items.sum { |item| item[:total_pay] }
    hits = items.map do |item|
      {
        hit:             item.hit,
        gds_id:          item.gds_id,
        book_status:     item.book_status,
        pay_status:      item.pay_status,
        provider_name:   item.provider_name,
        channel:         item.code,
        total_pay:       item.total_pay,
        total_book:      item.total_book,
        supplier_code:   item.supplier_code,
        book_percent:    (item.total_book.to_f / total_hits.to_f) * 100,
        payment_percent: (item.total_pay.to_f / total_pays.to_f) * 100
      }
    end
    {
      items: hits,
      total: {
        hits: total_hits,
        pays: total_pays,
        book: total_books,
        total_book_percent:    hits.sum { |item| item[:book_percent] },
        total_payment_percent: hits.sum { |item| item[:payment_percent] }
      }
    }
  end
end

# @items = @items.where("channel.code  = ?", params[:channel]) if params[:channel].present?
# @items = @items.where("hit.created_at >= ?", params[:date_from]) if params[:date_from].present?
# @items = @items.where("hit.created_at <= ?", params[:date_to]) if params[:date_to].present?
# @items = @items.where("hit.supplier_code = ?", params[:supplier_code]) if params[:supplier_code].present?
# @items = @items.where("hit.provider_name = ?", params[:provider_name]) if params[:provider_name].present?
# @items = @items.group("hit.supplier_code, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name, code")
