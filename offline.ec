import "ecere"  
import "mainpanel"
import "ports-setup"
import "sockets"

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

   bool OnClose(bool parentClosing)
   {
    
      service.Stop();
      service2.Stop();
     
      delete socket1;
      delete socket2;
      delete socket3;
      delete socket4;
      delete socket5;
      delete socket6;
      delete socket7;
      delete socket8;
      delete socket9;
      delete socket10;
      delete socket11;
      delete socket12;
      delete socket13;
      delete socket14;
      delete socket15;
      delete socket16; 

      return true;
   }
};
Offline offline { mainpanel,  autoCreate = false; };
