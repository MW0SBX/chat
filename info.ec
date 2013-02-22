import "ecere"  
import "mainpanel"

class Info : Window
{
   caption = "";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 150, 150 };
   moveable = true;

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

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        portssetup.Destroy(0);  

      return true;
   }
   Picture picture3 { picture1, this, "picture3", position = { 80, 200 }, image = { ":slogan.png" } };
   Picture picture2 { this, caption = "picture2", size = { 200, 200 }, position = { 100, 10 }, image = { ":flag.png" } };
   Picture picture4 { this, caption = "picture4", size = { 50, 50 }, position = { 25, 10 }, image = { ":china.png" },toolTip = "china" }; 
   Picture picture5 { this, caption = "picture5", size = { 50, 50 }, position = { 25, 80 }, image = { ":israel.png" },toolTip = "Israel" }; 
   Picture picture6 { this, caption = "picture6", size = { 50, 50 }, position = { 25, 150 }, image = { ":saudi.png" },toolTip = "Saudi Arabia" };
   Picture picture7 { this, caption = "picture7", size = { 50, 50 }, position = { 325, 10 }, image = { ":eu.png" },toolTip = "European Union" };
   Picture picture8 { this, caption = "picture8", size = { 50, 50 }, position = { 325, 80 }, image = { ":un.png" },toolTip = "United Nations" };
   Picture picture9 { this, caption = "picture9", size = { 50, 50 }, position = { 325, 150 }, image = { ":vatican.png" },toolTip = "The Vatican" }; 
   Picture picture10 { this, caption = "picture10", size = { }, position = { 0, 350 }, image = { ":anonssay.png" } };
};
Info info { mainpanel, autoCreate = false; };