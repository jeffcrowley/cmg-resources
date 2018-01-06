module ApplicationHelper

   def follow_exists(user, project)
      !Follow.where(user_id: user.id, project_id: project.id).blank? ? true : false #if a follow containing the user and project id's aren't blank (meaning that a follow relationship exists with a user and a project), return true, otherwise, return false.
   end

   def distro_centers
               { "Cherry Hill DC": "Stonhard\n7 Esterbrook Lane\nCherry Hill, NJ, 08003\n856-779-7500",
                  "Fort Wayne DC": "StonCor Distribution Center\n4115 Polymer Place\nFort Wayne, IN 46809\n(260) 496-8972",
                  "Garland, TX DC": "StonCor Distribution Center\n2805 Miller Park Drive\nGarland, TX 75042\n(972) 276-3640",
                  "Maple Shade DC": "StonCor Distribution Center\n14 Morris Avenue\nMaple Shade, NJ 08052\n(856) 779-7500",
                  "Marietta, GA DC": "StonCor Distribution Center\n1831-A West Oak Parkway\nMarietta, GA 30062\n(770) 425-6215",
                  "Miami, FL DC": "StonCor Distribution Center\n15801 NW 15th Ave\nMiami Gardens, FL 33169\n786-656-9932",
                  "Pennsauken, NJ DC": "StonCor Distribution Center\n1085 Thomas Bush Memorial Highway\nPennsauken, NJ 08110\n800-854-0310 x7794 (Ian Williams)",
                  "Richmond, CA DC": "StonCor Distribution Center\n1001 Canal Boulevard\nRichmond, CA 94804\n(510) 232-6030" }
   end

end
