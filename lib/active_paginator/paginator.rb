module ActivePaginator

  extend self

  class Paginator

    def initialize collection, universe_set_count=0
      raise TypeError, 'Collection doesn’t is ActiveRecord::Relation' unless collection.kind_of? ActiveRecord::Relation

      @collection = collection
      @universe_set_count = universe_set_count
      @limit = collection.size
      @page_index = 1
      @total_pages = total_pages
      @page = nil
    end
    attr_writer :collection, :universe_set_count
    attr_reader :page_index

    def total_pages
      if @universe_set_count === 0 || @limit === 0 || @limit > @universe_set_count
        total = 1
      else
        limit = @limit
        total = (@universe_set_count.to_f/limit).ceil
      end

      total
    end

    def page number=nil
      if @page.nil? || !number.nil?
        resolve_page_index(number || 1)
        # begins in 0
        @page = @collection.offset calc_offset
      end

      @page
    end

    private
      def resolve_page_index number
        number = number.to_i
        if number <= 0
          @page_index = 1
        elsif (number > @total_pages) && (@total_pages > 1)
          @page_index = @total_pages
        else
          @page_index = number
        end
      end

      def calc_offset
        if @page_index < @total_pages
          offset = 0
        elsif @page_index > @total_pages
          offset = @limit * (@total_pages - 1)
        else
          offset = @limit * (@page_index - 1)
        end
        offset
      end
  end
end
