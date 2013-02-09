import "ecere"  
import "mainpanel"


class Help : Window
{
   caption = "Help";
   background = black;
   opacity = 1;
   drawBehind = false;
   stayOnTop = true;  
   clientSize = { 400, 400 };
   position = { 155, 140 };
   moveable = true;
   hasClose = true; 

   HTMLView helpview1 { picture1, this, opacity = 1, visible = true, drawBehind = false, borderStyle = contour, size = { 390, 365 }, position = { 5, 10 }  };
   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":help.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360) { help.MenuWindowMove(null, mods); }      
   

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) {  help.Destroy(0);  }   
                            
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture30.visible = false;

         return true;
      }
      
   }

   bool OnCreate(void)
   {
      File f = FileOpen(":help.html", read); help.helpview1.OpenFile(f, null);
      delete f;

        about.Destroy(0);
        enckey.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        surfer.Destroy(0);
        portssetup.Destroy(0);  
        info.Destroy(0);

      return true;
   }
};
Help help { mainpanel, autoCreate = false; };
