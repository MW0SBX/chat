import "ecere"
import "console"
import "mainpanel"
  
class Changename : Window
{
   caption = "Changename";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   stayOnTop = true;
   clientSize = { 400, 119 };
   position = { 155, 140 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":nickname.png" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         
         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
   //      if(x > 0 && x < 400 && y > 0 && y < 39) { changename.MenuWindowMove(null, mods); }
   //      if(x > 300 && x < 370 && y > 0 && y < 39) { changename.MenuWindowMove(null, mods); }
   //      if(x > 370 && x < 400 && y > 100 && y < 120) { changename.MenuWindowMove(null, mods); }
   //      if(x > 0 && x < 400 && y > 103 && y < 120) { changename.MenuWindowMove(null, mods); }      
   //      if(x > 0 && x < 100 && y > 0 && y < 120) { changename.MenuWindowMove(null, mods); }

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 102 && x < 118 && y > 97 && y < 111) {  info.Create();  } 
            if(x > 128 && x < 147 && y > 97 && y < 111) {  changename.Destroy(0);  }   
            if(x > 321 && x < 354 && y > 33 && y < 66) {  changename.editBox.contents = ""; } 
            if(x > 352 && x < 388 && y > 33 && y < 66) {  File f = FileOpen("user_details.txt", write); f.PrintLn(" ", changename.editBox.contents, "   "); delete f;}
            if(x > 352 && x < 388 && y > 33 && y < 66) {changename.Destroy(0);  }
              
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture24.visible = false;

         return true;
      }
   }
   EditBox editBox { this, caption = "default", size = { 184, 25 }, position = { 110, 40 }, contents = "Anonymous" };

   bool OnCreate(void)
   {

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        info.Destroy(0);
        portssetup.Destroy(0);
         
      return true;
   }
}
Changename changename { mainpanel, autoCreate = false; };