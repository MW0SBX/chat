import "ecere"  
import "mainpanel"

class Sounds : Window
{
   caption = "Sounds";
   background = black;
   opacity = 0;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 120 };
   position = { 150, 150 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", inactive = false, position = {  }, image = { ":sounds.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 100) { sounds.MenuWindowMove(null, mods); }      
   

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 128 && x < 147 && y > 97 && y < 111) {  sounds.Destroy(0);  }   
                            
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture27.visible = false;

         return true;
      }
   }
};
Sounds sounds { mainpanel,  autoCreate = false };
