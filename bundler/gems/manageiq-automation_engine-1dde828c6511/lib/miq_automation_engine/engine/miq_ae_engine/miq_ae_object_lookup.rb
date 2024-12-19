module MiqAeEngine
  module MiqAeObjectLookup
    def initialize_obj_entries
      @lookup_hash = Hash.new { |h, k| h[k] = [] }
    end

    def add_obj_entry(fqns, klass, instance, object)
      parts = fqns.split('/')
      domain = parts.shift
      namespace = parts.join('/')
      @lookup_hash[klass.downcase] << {:domain    => domain.downcase,
                                       :namespace => namespace.downcase,
                                       :instance  => instance.downcase,
                                       :object    => object}
    end

    def find_obj_entry(path)
      query = path[0] == '/' ? parse_obj_path(path[1..-1]) : parse_obj_path(path)

      entries = @lookup_hash[query['class_name']]
      ientries = entries.select { |entry| instance_match?(query['instance'], entry) }
      find_best_match(ientries, query)
    rescue MiqAeException::InvalidPathFormat => err
      $miq_ae_logger.error(err.message)
      nil
    end

    def find_best_match(ientries, query)
      match = ientries.detect { |entry| fq_match?(query['domain'], query['partial_ns'], entry) }
      match ||= ientries.detect { |entry| ns_match?(query['fqns'], entry) }
      match[:object] if match
    end

    def ns_match?(namespace, entry)
      namespace == entry[:namespace]
    end

    def fq_match?(domain, namespace, entry)
      domain == entry[:domain] && namespace == entry[:namespace]
    end

    def instance_match?(instance, entry)
      File.fnmatch(instance, entry[:instance], File::FNM_CASEFOLD)
    end

    def parse_obj_path(path)
      parts = path.downcase.split('/')
      raise MiqAeException::InvalidPathFormat, "#{path} is invalid. Need at least Namespace/Class/Instance" if parts.length < 3

      {
        'instance'   => parts.pop,
        'class_name' => parts.pop,
        'fqns'       => parts.join('/'),
        'domain'     => parts.shift,
        'partial_ns' => parts.join('/')
      }
    end
  end
end
