class Message < ActiveRecord::Base
  belongs_to :users
  
  def self.from_uniq_user(current_user)
    @all_messages = self.find_all_by_recipient(current_user.id, :order => 'created_at DESC')
    @messages = @all_messages.uniq_by {|obj| obj.sender} 
    return @messages
  end
  
  def from_user_history(current_user)
    @messages = Message.find(:all, :conditions =>["user_id=? and recipient=?",current_user.id, self.sender], :order => 'created_at DESC', :limit => 7)
    return @messages
  end
end
