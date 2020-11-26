# == Schema Information
#
# Table name: jobs
#
#  id                     :integer          not null, primary key
#  advocates_count        :integer
#  application_date       :date
#  application_deadline   :string
#  application_mode       :string
#  application_next_steps :string
#  application_outcome    :string
#  application_status     :string
#  applied                :boolean
#  communications_count   :integer
#  location               :string
#  notes                  :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firm_id                :integer
#  user_id                :integer
#
class Job < ApplicationRecord
  
  has_many(:jobs, { :class_name => "Job", :foreign_key => "firm_id" })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "firm_id" })

  has_many(:employees, { :class_name => "Employee", :foreign_key => "firm_id" })

  #Add Indirect Associations (Guide)

  has_many(:connections, { :through => :employees, :source => :connections })

  has_many(:communications, { :through => :connections, :source => :communications })

  #Add Validations (Guide)

  validates(:name, { :presence => true })

  validates(:industry, { :inclusion => { :in => [ "Retail", "Tech", "CPG", "Consulting", "Finance", "Marketing", "Other" ] } })

end
