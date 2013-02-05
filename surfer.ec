import "ecere"  
import "mainpanel"
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"

class Surfer : Window
{
   caption = "Surfer";
   background = black;
   opacity = 0;
   clientSize = { 970, 734  };
   position = { 0, 0 };
   moveable = true;
   hasClose = true;
   

   HTMLView htmlview { picture1, this, opacity = 0, visible = true, drawBehind = false, borderStyle = contour, size = { 970, 734  }, position = { 5, 10 }  };
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
      //      if(x > 132 && x < 146 && y > 380 && y < 396) {  surfer.Destroy(0); mainpanel.picture32.visible = false;  }   
        mainpanel.picture32.visible = false;                   
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
        mainpanel.picture32.visible = false;
         return true;
      }
      
   }

   bool OnCreate(void)
   {  
        mainpanel.picture32.visible = false;
    //  File f = FileOpen(":help.html", read); surfer.htmlview.OpenFile(f, null);
    //  delete f;

      return true;
   }
            
};
Surfer surfer {autoCreate = false };
