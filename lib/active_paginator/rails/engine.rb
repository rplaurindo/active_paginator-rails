module ActivePaginator
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace ActivePaginator
    end
  end
end
