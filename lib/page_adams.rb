require "page_adams/engine"

module PageAdams
  mattr_accessor :page_size
  @@page_size = 10
  
  def self.setup
    yield self  
  end

  def self.included klass
    klass.extend ClassMethods
  end

  module ClassMethods
    def page page, page_size = PageAdams.page_size
      page = 1 if page.nil? or not page.is_a? Integer or page <= 0
      page_size = PageAdams.page_size unless page_size.is_a? Integer
      total_records = self.count
      # page_size = 10
      total_pages = ((total_records % page_size) == 0) ? total_records / page_size : total_records / page_size + 1
      records = self.offset(page_size * (page - 1)).limit(page_size)
      { records: records, current_page: page, total_pages: total_pages }
    end
  end
end
