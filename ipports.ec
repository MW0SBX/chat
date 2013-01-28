import "ecere"  
import "mainpanel"

class IPPorts : Window
{
   caption = "IPPorts";
   background = black;
   opacity = 0;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 150, 150 };
   moveable = true;

   TempFile chatfile{}; 

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":ipports.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360) { ipports.MenuWindowMove(null, mods); }      
   

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) {  ipports.Destroy(0);  }   
                            
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture26.visible = false;

         return true;
      }
   }
};
IPPorts ipports { mainpanel, autoCreate = false };
