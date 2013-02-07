import "ecere"  
import "mainpanel"


class Online : Window
{
   caption = "Online";
   background = black;
   opacity = 0;
   inactive = true;
   clientSize = { 400, 120 };
   position = { 150, 150 };
   visible = false;

   bool OnCreate(void)
   {
      File f = FileOpen(":dot.html", read); mainpanel.htmlview1.OpenFile(f, null); delete f;
      
        about.Destroy(0);     
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        info.Destroy(0);
        surfer.Destroy(0);
        portssetup.Destroy(0);
 //     online.Destroy(0);
        offline.Destroy(0);

      return true;
   }
};
Online online { mainpanel,  autoCreate = false };
