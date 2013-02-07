import "ecere"  
import "mainpanel"
import "sockets"
import "udp"
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"  
 

class Portssetup : Window
{
   caption = "Ports Setup";
   background = black;
   opacity = 0;
   borderStyle = fixed;
   hasClose = true;
   drawBehind = false;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 155, 140 };
   moveable = true;
   nativeDecorations = false;
   
   
   
   // TempFile chatfile{};

   Label label2 { picture1, this, "label2", position = { 8, 8 } };
   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { "/users/microchip/anonychat/res/ipports.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360)    { portssetup.MenuWindowMove(null, mods); }      
         if(x > 27 && x < 110 && y > 36 && y < 160)  {  portssetup.picture30.visible = true; 
         
         //doesnt work
         socket1.DatagramHost(atoi(editBox5.contents)); 
         socket2.DatagramHost(atoi(editBox6.contents)); 
         socket3.DatagramHost(atoi(editBox7.contents)); 
         socket4.DatagramHost(atoi(editBox8.contents)); 
         socket5.DatagramHost(atoi(editBox9.contents)); 
         socket6.DatagramHost(atoi(editBox10.contents)); 
         socket7.DatagramHost(atoi(editBox11.contents)); 
         socket8.DatagramHost(atoi(editBox12.contents)); 
         socket9.DatagramHost(atoi(editBox13.contents)); 
         socket10.DatagramHost(atoi(editBox14.contents)); 
         socket11.DatagramHost(atoi(editBox15.contents)); 
         socket12.DatagramHost(atoi(editBox16.contents)); 
         socket13.DatagramHost(atoi(editBox17.contents)); 
         socket14.DatagramHost(atoi(editBox18.contents)); 
         socket15.DatagramHost(atoi(editBox19.contents));
         socket16.DatagramHost(atoi(editBox20.contents));    

    // commented out but works
   //   socket1.DatagramHost(50001);  //incomming
   //   socket2.DatagramHost(50002);
   //   socket3.DatagramHost(50003);
   //   socket4.DatagramHost(50004);
   //   socket5.DatagramHost(50005);
   //   socket6.DatagramHost(50006);
  //    socket7.DatagramHost(50007);
  //    socket8.DatagramHost(50008);
     
  //    socket9.DatagramHost(60001);   //outgoing 
  //    socket10.DatagramHost(60002);  
  //    socket11.DatagramHost(60003);
  //    socket12.DatagramHost(60004);
  //    socket13.DatagramHost(60005);
  //    socket14.DatagramHost(60006);
  //    socket15.DatagramHost(60007);
  //    socket16.DatagramHost(60008);
        
      mainpanel.picture29.visible = false; 
      mainpanel.picture28.visible = true;   
      online.Create();
         
         } //p2p-connect 

         if(x > 33 && x < 98 && y > 301 && y < 361)  {  portssetup.picture31.visible = true; } //save-settings

         return true; 

      };

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) {  portssetup.Destroy(0);  }         
                    
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture26.visible = false;

         //connect
         if(x > 98 && x < 120 && y > 18 && y < 183){ portssetup.picture30.visible = false; }   //right 
         if(x > 20 && x < 120 && y > 18 && y < 38)  { portssetup.picture30.visible = false; }   //top       
         if(x > 20 && x < 120 && y > 163 && y < 183){ portssetup.picture30.visible = false; }   //bottom 
         if(x > 20 && x < 33 && y > 18 && y < 183) { portssetup.picture30.visible = false; }   //left


         //save
         if(x > 114 && x < 120 && y > 302 && y < 391){ portssetup.picture31.visible = false; }   //right 
         if(x > 20 && x < 120 && y > 280 && y < 301){ portssetup.picture31.visible = false; }   //top       
         if(x > 20 && x < 120 && y > 362 && y < 391){ portssetup.picture31.visible = false; }   //bottom 
         if(x > 20 && x < 28 && y > 301 && y < 381){ portssetup.picture31.visible = false; }   //left 


         return true;
      }
   }
   Label label21{ this, caption = "Note! do not change this unless you want to make unique chat clients", foreground = white, background = black, position = { 10, 10  } };
   Label label20{ this, caption = "Send String", foreground = white, background = black, position = { 20, 185  } };
   Label label19 { this, caption = "Recieve String", foreground = white, background = black, position = { 20, 235  } };
   Label label18 { this, caption = "TCP Ports", foreground = white, background = black, position = { 150, 65  } };
   Label label17 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 150, 85  } };
   Label label16 
   {      
      this, caption = "Transmit (TX)", background = black, foreground = white, position = { 280, 85 };

      
   };
   Label label15 { this, caption = "UDP Ports", foreground = white, background = black, position = { 150, 140     }  };
   Label label14 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 150, 160  }  };
   Label label13 { this, caption = "Transmit (TX)", foreground = white, background = black, position = { 280, 160 }  };

   Picture picture2  { picture1, this, "50001",          position = { 135, 175 }, visible = true,  image = { ":dot.png" }; }; //udp recieve
   Picture picture3  { picture1, this, "50002",          position = { 135, 200 }, visible = true,  image = { ":dot.png" }; };
   Picture picture4  { picture1, this, "50003",          position = { 135, 225 }, visible = true,  image = { ":dot.png" }; };
   Picture picture5  { picture1, this, "50004",          position = { 135, 250 }, visible = true,  image = { ":dot.png" }; };
   Picture picture6  { picture1, this, "50005",          position = { 135, 275 }, visible = true,  image = { ":dot.png" }; };
   Picture picture7  { picture1, this, "50006",          position = { 135, 300 }, visible = true,  image = { ":dot.png" }; };
   Picture picture8  { picture1, this, "50007",          position = { 135, 325 }, visible = true,  image = { ":dot.png" }; };
   Picture picture9  { picture1, this, "50008",          position = { 135, 350 }, visible = true,  image = { ":dot.png" }; };
   Picture picture10 { picture1, this, "60001",          position = { 265, 175 }, visible = true,  image = { ":dot.png" }; }; //udp transmit
   Picture picture11 { picture1, this, "60002",          position = { 265, 200 }, visible = true,  image = { ":dot.png" }; };
   Picture picture12 { picture1, this, "60003",          position = { 265, 225 }, visible = true,  image = { ":dot.png" }; };
   Picture picture13 { picture1, this, "60004",          position = { 265, 250 }, visible = true,  image = { ":dot.png" }; };
   Picture picture14 { picture1, this, "60005",          position = { 265, 275 }, visible = true,  image = { ":dot.png" }; };
   Picture picture15 { picture1, this, "60006",          position = { 265, 300 }, visible = true,  image = { ":dot.png" }; };
   Picture picture16 { picture1, this, "60007",          position = { 265, 325 }, visible = true,  image = { ":dot.png" }; };
   Picture picture17 { picture1, this, "60008",          position = { 265, 350 }, visible = true,  image = { ":dot.png" }; };
   Picture picture18 { picture1, this, "40000",          position = { 135, 100 }, visible = true,  image = { ":dot.png" }; };
   Picture picture19 { picture1, this, "40001",          position = { 265, 100 }, visible = true,  image = { ":dot.png" }; };
   Picture picture30 { picture1, this, "connect over",   position = { 28, 36   }, visible = false, image = { ":p2p-connect.png" }; };
   Picture picture31 { picture1, this, "save settings",  position = { 31, 299  }, visible = false, image = { ":save-settings.png" }; };
   
   EditBox editBox1  { this, caption = "40000",          contents = "40000",    position = { 150, 100 } };     //tcp recieve
   EditBox editBox2  { this, caption = "40001",          contents = "40001",    position = { 280, 100 } };     //tcp transmit
   EditBox editBox3  { this, caption = "send string",    contents = "00000111", position = { 20, 200  } };  //send string
   EditBox editBox4  { this, caption = "recieve string", contents = "11100000", position = { 20, 250  } };  //recieve string
   
   EditBox editBox5  { this, caption = "50001", contents = "50001",position = { 150, 175 } };  //udp recieve
   EditBox editBox6  { this, caption = "50002", contents = "50002",position = { 150, 200 } };  //udp recieve
   EditBox editBox7  { this, caption = "50003", contents = "50003",position = { 150, 225 } };  //udp recieve
   EditBox editBox8  { this, caption = "50004", contents = "50004",position = { 150, 250 } };  //udp recieve
   EditBox editBox9  { this, caption = "50005", contents = "50005",position = { 150, 275 } };  //udp recieve
   EditBox editBox10 { this, caption = "50006", contents = "50006",position = { 150, 300 } };  //udp recieve
   EditBox editBox11 { this, caption = "50007", contents = "50007",position = { 150, 325 } };  //udp recieve
   EditBox editBox12 { this, caption = "50008", contents = "50008",position = { 150, 350 } };  //udp recieve
   EditBox editBox13 { this, caption = "60001", contents = "60001",position = { 280, 175 } };  //udp transmit
   EditBox editBox14 { this, caption = "60002", contents = "60002",position = { 280, 200 } };  //udp transmit
   EditBox editBox15 { this, caption = "60003", contents = "60003",position = { 280, 225 } };  //udp transmit
   EditBox editBox16 { this, caption = "60004", contents = "60004",position = { 280, 250 } };  //udp transmit
   EditBox editBox17 { this, caption = "60005", contents = "60005",position = { 280, 275 } };  //udp transmit
   EditBox editBox18 { this, caption = "60006", contents = "60006",position = { 280, 300 } };  //udp transmit
   EditBox editBox19 { this, caption = "60007", contents = "60007",position = { 280, 325 } };  //udp transmit
   EditBox editBox20 { this, caption = "60008", contents = "60008",position = { 280, 350 } };  //udp transmit
   
      
    
bool OnCreate(void)
      {

        about.Destroy(0);     
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        info.Destroy(0);
        surfer.Destroy(0);
  //    portssetup.Destroy(0);
        online.Destroy(0);
        offline.Destroy(0);

         return true;

      }                               

};

Portssetup portssetup { mainpanel, autoCreate = false };
