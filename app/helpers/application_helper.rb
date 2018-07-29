module ApplicationHelper
  def is_admin?
    current_user.roles.where(name: "admin").count == 1
  end
  def is_leader?
    current_user.roles.where(name: "leader").count == 1
  end
  def is_moderator?
    current_user.roles.where(name: "moderator").count == 1
  end
  def is_manager?
    current_user.roles.where(name: "manager").count == 1
  end
  def is_verifier?
    current_user.roles.where(name: "verifier").count == 1
  end
  def is_member?
    current_user.roles.where(name: "member").count == 1
  end

  def newStatus
    Status.find_by_name("new")
  end
  def approvedStatus
    Status.find_by_name("approved")
  end
  def rejectedStatus
    Status.find_by_name("rejected")
  end
  def activeStatus
    Status.find_by_name("active")
  end
  def completeStatus
    Status.find_by_name("completed")
  end
  def cancelStatus
    Status.find_by_name("cancelled")
  end
end
