import "ecere"
import "mainpanel"
import "ports-setup"
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"

class Online : Window
{  
   caption = "Online";
   background = 0;
   opacity = 0;
   inactive = true;
   drawBehind = false;
   stayOnTop = true;  
   clientSize = { 400, 120 };
   position = { 150, 150 };
   visible = false;

   bool OnCreate(void)
   {  
      File f = FileOpen(":dot.html", read); mainpanel.htmlview1.OpenFile(f, null);
   
      offline.Destroy(0);  
      
      return true;
   }  
};
Online online { mainpanel,  autoCreate = false; };
