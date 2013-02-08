import "ecere"  
import "mainpanel"
import "ports-setup"

class Offline : Window
{
   caption = "Offline";
   background = black;
   opacity = 0;
   inactive = true;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 120 };
   position = { 150, 150 };
   visible = false;

   bool OnCreate(void)
   {
      File f = FileOpen(":dot-null.html", read); mainpanel.htmlview1.OpenFile(f, null);
      
      mainpanel.picture29.visible = true; 
      mainpanel.picture28.visible = false; 

       online.Destroy(0);
       offline.Destroy(0);

      return true;
   }

};
Offline offline { mainpanel,  autoCreate = false };
