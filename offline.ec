import "ecere"  
import "mainpanel"
import "ports-setup"
import "socket1udp"
import "socket2udp"
import "socket3udp"
import "socket4udp"
import "socket5udp"
import "socket6udp"
import "socket7udp"
import "socket8udp"
import "socket9udp"
import "socket10udp"
import "socket11udp"
import "socket12udp"
import "socket13udp"
import "socket14udp"
import "socket15udp"
import "socket16udp"
import "socket17tcp" 
import "socket18tcp"

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
    
      service17.Stop();
      service18.Stop();
      tcpServer.Stop();
   
      delete socket1; socket1 = { };
      delete socket2; socket2 = { };
      delete socket3; socket3 = { };
      delete socket4; socket4 = { };
      delete socket5; socket5 = { };
      delete socket6; socket6 = { };
      delete socket7; socket7 = { };
      delete socket8; socket8 = { };
      delete socket9; socket9 = { };
      delete socket10; socket10 = { };
      delete socket11; socket11 = { };
      delete socket12; socket12 = { };
      delete socket13; socket13 = { };
      delete socket14; socket14 = { };
      delete socket15; socket15 = { };
      delete socket16; socket16 = { };

   mainpanel.picture49.visible = false;
   mainpanel.picture50.visible = false;
   mainpanel.picture51.visible = false;
   mainpanel.picture52.visible = false;  
   mainpanel.picture53.visible = false;
   mainpanel.picture54.visible = false;
   mainpanel.picture55.visible = false;
   mainpanel.picture56.visible = false;
   mainpanel.picture57.visible = false;
   mainpanel.picture58.visible = false;
   mainpanel.picture59.visible = false;
   mainpanel.picture60.visible = false;  
   mainpanel.picture61.visible = false;
   mainpanel.picture62.visible = false;
   mainpanel.picture63.visible = false;
   mainpanel.picture64.visible = false;
   mainpanel.picture68.visible = false;
   mainpanel.picture69.visible = false;
   mainpanel.picture70.visible = false;    
   
   mainpanel.picture65.visible = true;


      return true;
   }
};
Offline offline { mainpanel,  autoCreate = false; };
