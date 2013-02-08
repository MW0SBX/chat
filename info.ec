import "ecere"  
import "mainpanel"

class Info : Window
{
   caption = "info";
   background = black;
   drawBehind = false;
   stayOnTop = true;   
   clientSize = { 400, 400 };
   position = { 150, 150 };
   moveable = true;
   hasClose = true; 

   HTMLView infoview { picture1, this, opacity = 0, visible = true, drawBehind = false, borderStyle = none, size = { 390, 365 }, position = { 5, 10 }  };
   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":help.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360) { info.MenuWindowMove(null, mods); }      
   

         return true; 

      }

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) {  info.Destroy(0);  }   
                            
         return true;
      }
      
   }  

   bool OnCreate(void)
   {
      File f = FileOpen(":info.html", read); info.infoview.OpenFile(f, null); 
      delete f;

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        surfer.Destroy(0);
        portssetup.Destroy(0);  

      return true;
   }
};
Info info { mainpanel, autoCreate = false; };