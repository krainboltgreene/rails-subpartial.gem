module ActionView
  class PartialRenderer < AbstractRenderer
    def find_template(path, locals)
      prefixes = path.start_with?("/") ? [] : @lookup_context.prefixes
      @lookup_context.find_template(path, prefixes, true, locals, @details)
    end

    def merge_prefix_into_object_path(prefix, object_path)
      if prefix.start_with?("/") && object_path.start_with?("/")
        prefixes = []
        prefix_array = File.dirname(prefix).split('/')
        object_path_array = object_path.split('/')[0..-3] # skip model dir & partial

        prefix_array.each_with_index do |dir, index|
          break if dir == object_path_array[index]
          prefixes << dir
        end

        (prefixes << object_path).join("/")
      else
        object_path
      end
    end
  end
end
