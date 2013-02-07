import "ecere"  
//import "mainpanel"
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"

class Surfer : Window
{
   caption = "Surfer";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   clientSize = { 970, 734 };
   position = {  };
   moveable = true;

   HTMLView htmlviewer { picture1, this, opacity = 0, visible = true, drawBehind = false, borderStyle = contour, size = { 970, 734  }, position = { 5, 10 }  };
   Picture picture1 
   {
      this, caption = "mainframe", position = {  };  

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         
         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 970 && y > 0 && y < 734) { surfer.MenuWindowMove(null, mods); }      
   
           mainpanel.picture32.visible = false;
         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
        
        mainpanel.picture32.visible = false;                   
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
      
         return true;
      }
      
   }

   bool OnCreate(void)
   {


        about.Destroy(0);     
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        info.Destroy(0);
//      surfer.Destroy(0);
        portssetup.Destroy(0);
        online.Destroy(0);
        offline.Destroy(0);

      return true;
   }
};
Surfer surfer {autoCreate = false };
