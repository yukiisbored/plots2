class DrupalNodeCounter < ActiveRecord::Base
  attr_accessible :totalcount, :nid
  self.table_name = 'node_counter'

  belongs_to :drupal_node, :foreign_key => 'nid', :dependent => :destroy

  is_impressionable

  def totalcount
    impressionist_count(:filter=>:ip_address)
  end
end
