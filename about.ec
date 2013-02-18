import "ecere"  
import "mainpanel"

class About : Window
{
   caption = "About";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 155, 140 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":chat-form2.png" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360) { about.MenuWindowMove(null, mods); }      
   

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {  
            if(x > 132 && x < 146 && y > 380 && y < 396) {  about.Destroy(0);  }   
            if(x > 102 && x < 118 && y > 380 && y < 396) {  info.Create();  }                
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture31.visible = false;

         return true;
      }

      bool OnCreate(void)
      { 
        
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        portssetup.Destroy(0);  
        info.Destroy(0);

         return Picture::OnCreate();
      }
   }
};
About about { mainpanel, autoCreate = false; };