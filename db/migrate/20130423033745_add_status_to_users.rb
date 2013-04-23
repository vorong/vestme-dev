# Adding status to track active, unsubscribed, test users, etc.  Definitions below.
# 
# ------+----------------------------------------------
# Value	| Meaning
# ------+----------------------------------------------
#     0	| Active (default)
#     1	| Unsubscribed
#     2	| Invalid email address, e.g. got email bounce
#     3	| Beta test account, e.g. friends and family
#     4	| Dev account, e.g. one of us
#    5+	| Reserved for future use
# ------+----------------------------------------------
#

class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :integer, :default => 0
  end
end
