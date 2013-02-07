import "ecere"  
import "mainpanel"

class About : Window
{
   caption = "About";
   background = black;
   opacity = 0;
   borderStyle = fixed;
   hasClose = true;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 150, 150 };
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
            if(x > 160 && x < 260 && y > 360 && y < 400) {  about.Destroy(0);  }   
                            
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture31.visible = false;

         return true;
      }
   }

   bool OnCreate(void)
   {
        
       
  //    about.Destroy(0);     
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        info.Destroy(0);
        surfer.Destroy(0);
        portssetup.Destroy(0);
        online.Destroy(0);
        offline.Destroy(0);
         
      return true;
   }
};
About about { mainpanel, autoCreate = false };
