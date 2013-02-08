import "ecere"  
import "mainpanel"

class Surfer : Window
{
   caption = "Internet p2p";
   hasClose = true;
   clientSize = { 986, 690 };
   moveable = true;

   HTMLView surfview1 { this, opacity = 0, visible = true, drawBehind = false, borderStyle = none, size = { 984, 688 }, position = { 2, 2 }  };
   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { "" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {
         mainpanel.picture32.visible = false;
         return true;
      }
   }

   bool OnCreate(void)
   {
      File f = FileOpen(":help.html", read); surfview1.OpenFile(f, null);
      //delete f;
      
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      mainpanel.picture32.visible = false;
      return true;
   }
};
Surfer surfer { autoCreate = false; };