module Buckle
  class StyleGuide

    def initialize
    end

    def people_for_table
      [
        ['Mark', 'Otto', '@mdo'],
        ['Jacob', 'Thorton', '@fat'],
        ['Larry', 'Thebird', '@twitter']
      ]
    end

    def table_contexts
      contexts = {
        active: 'Applies the hover color to a particular row or cell',
        success: 'Indicates a successful or positive action',
        warning: 'Indicates a warning that might need attention',
        danger: 'Indicates a dangerous or potentially negative action'
      }
      contexts.stringify_keys.to_a
    end

  end
end
