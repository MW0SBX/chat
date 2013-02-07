import "ecere"
import "console"
import "mainpanel"
  
class Changename : Window
{
   caption = "Changename";
   background = black;
   opacity = 0;
   borderStyle = fixed;
   hasClose = true;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 119 };
   position = { 150, 150 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":nickname.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         
         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 39) { changename.MenuWindowMove(null, mods); }
         if(x > 300 && x < 370 && y > 0 && y < 39) { changename.MenuWindowMove(null, mods); }
         if(x > 370 && x < 400 && y > 100 && y < 120) { changename.MenuWindowMove(null, mods); }
         if(x > 0 && x < 400 && y > 103 && y < 120) { changename.MenuWindowMove(null, mods); }      
         if(x > 0 && x < 100 && y > 0 && y < 120) { changename.MenuWindowMove(null, mods); }

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 267 && x < 370 && y > 70 && y < 102) {  changename.Destroy(0);  }
            if(x > 143 && x < 248 && y > 70 && y < 102) {  changename.editBox.contents = ""; } 
            if(x > 267 && x < 370 && y > 70 && y < 102) {  File f = FileOpen("user_details.txt", write); f.PrintLn(" ", changename.editBox.contents, "   "); delete f;}
       
              
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture24.visible = false;

         return true;
      }
   }
   EditBox editBox { this, caption = "default", size = { 184, 19 }, position = { 130, 40 }, contents = "Anonymous" };

   bool OnCreate(void)
   {

        about.Destroy(0);     
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
  //    changename.Destroy(0);
        info.Destroy(0);
        surfer.Destroy(0);
        portssetup.Destroy(0);
        online.Destroy(0);
        offline.Destroy(0);
        

      return true;
   }
}

Changename changename { mainpanel, autoCreate = false };