# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  firm_id    :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
  belongs_to(:firm, { :required => false, :class_name => "Firm", :foreign_key => "firm_id", :counter_cache => true })
  
  #Add Validations (Guide)
  
  validates(:user_id, { :presence => true })
  
  validates(:firm_id, { :presence => true })


end
