module ApplicationHelper
  def Index index
	  index = index.zero? ? index = 1 : index += 1
  end
end
