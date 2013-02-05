import "ecere"  
import "mainpanel"
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"


class Info : Window
{
   caption = "info";
   background = black;
   opacity = 1;
   drawBehind = false;
   stayOnTop = true; 
   clientSize = { 400, 400 };
   position = { 150, 150 };
   moveable = true;
   hasClose = true; 



   HTMLView htmlview { picture1, this, opacity = 1, visible = true, drawBehind = false, borderStyle = contour, size = { 390, 365 }, position = { 5, 10 }  };
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

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) {  info.Destroy(0);  }   
                            
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
       //  mainpanel.picture30.visible = false;

         return true;
      }
      
   }

   bool OnCreate(void)
   {
      File f = FileOpen(":info.html", read); info.htmlview.OpenFile(f, null);
      return true;
   }
};
Info info { mainpanel, autoCreate = false };