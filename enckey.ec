import "ecere"  
import "mainpanel"
import "console"

class Enckey : Window 
{
   caption = "Enckey";
   background = black;
   opacity = 0;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 120 };
   position = { 150, 150 };
   moveable = true;
   hasClose = true;

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":encryption.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         enckey.editBox1.contents = "0101010101000000011100100"; 
         enckey.editBox2.contents = "0101010101000000011100100"; 
         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)  
      {  
           
         if(x > 0 && x < 400 && y > 0 && y < 100) { enckey.MenuWindowMove(null, mods); }      
         if(x > 160 && x < 260 && y > 88 && y < 113) {  enckey.editBox1.contents = "0101010101000000011100100"; }
         if(x > 160 && x < 260 && y > 88 && y < 113) {  enckey.editBox2.contents = "0101010101000000011100100"; }  
                  
         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {

         if(x > 283 && x < 383 && y > 88 && y < 113) { File f = FileOpen("key1.txt", write); f.PrintLn(enckey.editBox1.contents); delete f;
      
         
         if(f)
         {
            mainpanel.htmlview.OpenFile(f, null);
            delete f;
         }
         
         
         } 
         if(x > 283 && x < 383 && y > 88 && y < 113) { File f = FileOpen("key2.txt", write); f.PrintLn(enckey.editBox2.contents); delete f; 
         
         if(f)
         {
            mainpanel.htmlview.OpenFile(f, null);
            delete f;
         }
            
         
         }
         if(x > 283 && x < 383 && y > 88 && y < 113) {  enckey.Destroy(0); }
         if(x > 128 && x < 147 && y > 97 && y < 111) {  enckey.Destroy(0);  }   

         }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture25.visible = false;

         return true;
      }
   }
   EditBox editBox1 { this, caption = "editBox1", size = { 254, 19 }, anchor = { horz = 55, vert = 6 }, scrollArea = { 264, 15 }, contents = "0101010101000000011100100"; };
   EditBox editBox2 { this, caption = "editBox2", size = { 254, 19 }, anchor = { horz = 55, vert = -18 }, scrollArea = { 264, 15 }, contents = "0101010101000000011100100"; };
};      
Enckey enckey { mainpanel, autoCreate = false };   