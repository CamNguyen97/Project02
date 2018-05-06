module ApplicationHelper
  def Index index
	  index = index.zero? ? index = Settings.helper.num_index : index += Settings.helper.num_index
  end
end
