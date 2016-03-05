module ApplicationHelper
  
  # def search_form_for(record, options = {}, &proc)
  #   if record.is_a? Ransack::Search
  #     search = record
  #     options[:url] ||= polymorphic_path(
  #       search.klass, format: options.delete(:format)
  #       )
  #   elsif record.is_a?(Array) &&
  #   (search = record.detect { |o| o.is_a?(Ransack::Search) })
  #     options[:url] ||= polymorphic_path(
  #       options_for(record), format: options.delete(:format)
  #       )
  #   else
  #     raise ArgumentError,
  #     'No Ransack::Search object was provided to search_form_for!'
  #   end
  #   options[:html] ||= {}
  #   html_options = {
  #     class:  html_option_for(options[:class], search),
  #     id:     html_option_for(options[:id], search),
  #     method: :get
  #   }
  #   options[:as] ||= Ransack.options[:search_key]
  #   options[:html].reverse_merge!(html_options)
  #
  #   form_for(record, options, &proc)
  # end
  # #
  # def sort_link(search_object, attribute, *args, &block)
  #       search, routing_proxy = extract_search_and_routing_proxy(search_object)
  #       unless Search === search
  #         raise TypeError, 'First argument must be a Ransack::Search!'
  #       end
  #       args.unshift(capture(&block)) if block_given?
  #       s = SortLink.new(search, attribute, args, params, &block)
  #       link_to(s.name, url(routing_proxy, s.url_options), s.html_options(args))
  #     end

  private

  def options_for(record)
    record.map { |r| parse_record(r) }
  end

  def parse_record(object)
    return object.klass if object.is_a?(Ransack::Search)
    object
  end

  def html_option_for(option, search)
    return option.to_s if option.present?
    "#{search.klass.to_s.underscore}_search"
  end

  def extract_search_and_routing_proxy(search)
    return [search[1], search[0]] if search.is_a?(Array)
    [search, nil]
  end

  def url(routing_proxy, options_for_url)
    if routing_proxy && respond_to?(routing_proxy)
      send(routing_proxy).url_for(options_for_url)
    else
      url_for(options_for_url)
    end
  end
end
