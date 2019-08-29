# frozen_string_literal: true

class Hit < DevMaSchema
  self.table_name = 'hit'
  belongs_to :order
  belongs_to :channel

  def self.listing(params)
    items = select('
      count(hit.id) as hit, 
      hit.supplier_code, 
      hit.second_validation_supplier as second_supplier, 
      hit.gds_id, 
      hit.book_status, 
      count(hit.book_status) as total_book, 
      hit.pay_status, 
      count(hit.pay_status) as total_pay, 
      hit.provider_name, 
      channel.code as code'
    )
    items = items.joins(:channel)
    items = items.where('channel.code  = ?', params[:channel]) if params[:channel].present?
    items = items.where('hit.created_at >= ?', params[:hit_date_from]) if params[:hit_date_from].present?
    items = items.where('hit.created_at <= ?', params[:hit_date_to]) if params[:hit_date_to].present?
    items = items.where('hit.supplier_code = ?', params[:supplier_code]) if params[:supplier_code].present?
    items = items.where('hit.second_validating_supplier = ?', params[:second_validating_supplier]) if params[:second_validating_supplier].present?
    items = items.where('hit.provider_name = ?', params[:provider_name]) if params[:provider_name].present?
    items = items.group('hit.supplier_code, second_supplier, hit.gds_id, hit.book_status, hit.pay_status, hit.provider_name, code')

    total_hits            = items.sum { |item| item[:hit] }
    total_books           = items.sum { |item| item[:total_book] }
    total_pays            = items.sum { |item| item[:total_pay] }
    provider_hits         = {}
    items.each do |item|
      provider_hits[item.provider_name] ||= 0
      provider_hits[item.provider_name] += item.hit
    end
    provider_books        = {}
    items.each do |item|
      provider_books[item.provider_name] ||= 0
      provider_books[item.provider_name] += item.total_book
    end
    provider_pays         = {}
    items.each do |item|
      provider_pays[item.provider_name] ||= 0
      provider_pays[item.provider_name] += item.total_pay
    end        
    hits = items.map do |item|
      {
        hit:                        item.hit,
        gds_id:                     item.gds_id,
        book_status:                item.book_status,
        pay_status:                 item.pay_status,
        provider_name:              item.provider_name,
        channel:                    item.code,
        total_pay:                  item.total_pay,
        total_book:                 item.total_book,
        supplier_code:              item.supplier_code,
        second_validating_supplier: item.second_supplier,
        book_percent:               (item.total_book.to_f / total_hits.to_f) * 100,
        payment_percent:            (item.total_pay.to_f / total_pays.to_f) * 100
      }
    end
    {
      items: hits,
      total: {
        hits: total_hits,
        pays: total_pays,
        book: total_books,
        total_book_percent:    hits.sum { |item| item[:book_percent] },
        total_payment_percent: hits.sum { |item| item[:payment_percent] },
        provider_hits:         provider_hits,
        provider_books:        provider_books,
        provider_pays:         provider_pays
      }
    }
  end
end