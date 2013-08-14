# encoding: utf-8

module Rubocop
  module Cop
    module Style
      # This cop checks whether comments have a leading space
      # after the # denoting the start of the comment. The
      # leading space is not required for some RDoc special syntax,
      # like #++, #--, #:nodoc, etc.
      class LeadingCommentSpace < Cop
        MSG = 'Missing space after #.'

        def investigate(processed_source)
          processed_source.comments.each do |comment|
            if comment.text =~ /^#+[^#\s:+-]/
              unless comment.text.start_with?('#!') && comment.loc.line == 1
                add_offence(:convention, comment.loc.expression, MSG)
              end
            end
          end
        end
      end
    end
  end
end