module EateriesHelper

  def owner?
    debugger
    if current_user.try(:role) === "owner"
      #debugger
      true
    else
      false
    end

  end
end
