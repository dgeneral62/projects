class Friend < ActiveRecord::Base
  #searchkick
  belongs_to :user
  belongs_to :friendship, :class_name => "user"
  #searchkick
  # Searchkick for dynamic searching features (searchkick callbacks: false)
end
