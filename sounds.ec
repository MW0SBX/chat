import "ecere"  
import "mainpanel"


class Sounds : Window
{
   caption = "Sounds";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   stayOnTop = true;
   clientSize = { 400, 120 };
   position = { 155, 140 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", inactive = false, position = {  }, image = { ":sounds.png" };

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
            if(x > 102 && x < 118 && y > 97 && y < 111) {  info.Create();  }                 
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture27.visible = false;

         return true;
      }

      bool OnCreate(void)
      {

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        changename.Destroy(0);
        portssetup.Destroy(0);  
        info.Destroy(0);

         return Picture::OnCreate();
      }
   }
};
Sounds sounds { mainpanel,  autoCreate = false; };
