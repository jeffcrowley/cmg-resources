module ReturnsHelper

   def distro_name(center)
      case center
      when "Stonhard\r\n7 Esterbrook Lane\r\nCherry Hill, NJ, 08003\r\n856-779-7500"
         return "Cherry Hill DC"
      when "StonCor Distribution Center\r\n4115 Polymer Place\r\nFort Wayne, IN 46809\r\n(260) 496-8972"
         return "Fort Wayne DC"
      when "StonCor Distribution Center\r\n2805 Miller Park Drive\r\nGarland, TX 75042\r\n(972) 276-3640"
         return "Garland, TX DC"
      when "StonCor Distribution Center\r\n14 Morris Avenue\r\nMaple Shade, NJ 08052\r\n(856) 779-7500"
         return "Maple Shade DC"
      when "StonCor Distribution Center\r\n1831-A West Oak Parkway\r\nMarietta, GA 30062\r\n(770) 425-6215"
         return "Marietta, GA DC"
      when "StonCor Distribution Center\r\n15801 NW 15th Ave\r\nMiami Gardens, FL 33169\r\n786-656-9932"
         return " Miami, FL DC"
      when "StonCor Distribution Center\r\n1085 Thomas Bush Memorial Highway\r\nPennsauken, NJ 08110\r\n800-854-0310 x7794 (Ian Williams)"
         return "Pennsauken, NJ DC"
      when "StonCor Distribution Center\r\n1001 Canal Boulevard\r\nRichmond, CA 94804\r\n(510) 232-6030"
         return "Richmond, CA DC"
      else
         return center
      end
   end



end
