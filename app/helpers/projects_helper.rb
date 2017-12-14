module ProjectsHelper

   def follow_exists(user, project)
      !Follow.where(user_id: user.id, project_id: project.id).blank? ? true : false #if a follow containing the user and project id's aren't blank (meaning that a follow relationship exists with a user and a project), return true, otherwise, return false.
   end

end
