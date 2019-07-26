# frozen_string_literal: true

require 'os'

###
# @description: File Class
###
class Path
  def convert(path)
    OS.windows? ? path.tr('/', '\\') : path
  end
end
