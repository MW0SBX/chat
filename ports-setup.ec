import "ecere"  
import "mainpanel"
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

class Portssetup : Window
{
   caption = "";
   background = black;
   borderStyle = fixed;
   hasClose = true;
   stayOnTop = true;
   clientSize = { 400, 400 };
   position = { 155, 140 };
   moveable = true;

   Picture picture1 
   {
      this, caption = "mainframe", position = {  }, image = { ":ipports.gif" };

      bool NotifyActivate(Window window, bool active, Window previous)
      {

         return true;
      }

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         if(x > 0 && x < 400 && y > 0 && y < 360) { portssetup.MenuWindowMove(null, mods); }
         
         if(x > 340 && x < 384 && y > 110 && y < 150) { 
         
         portssetup.picture22.visible = true; 
         
         portssetup.editBox1.contents = "40001";
         portssetup.editBox2.contents = "40002";
         portssetup.sentString.contents = "00000111";
         portssetup.recvString.contents = "11100000";
         portssetup.editBox5.contents = "50001";
         portssetup.editBox6.contents = "50002";
         portssetup.editBox7.contents = "50003";
         portssetup.editBox8.contents = "50004";
         portssetup.editBox9.contents = "50005";
         portssetup.editBox10.contents = "50006";
         portssetup.editBox11.contents = "50007";
         portssetup.editBox12.contents = "50008";
         portssetup.editBox13.contents = "60001";
         portssetup.editBox14.contents = "60002";
         portssetup.editBox15.contents = "60003";
         portssetup.editBox16.contents = "60004";
         portssetup.editBox17.contents = "60005";
         portssetup.editBox18.contents = "60006";
         portssetup.editBox19.contents = "60007";
         portssetup.editBox20.contents = "60008"; 
         portssetup.serverAddress.contents = "localhost";
         portssetup.serverPort.contents = "40003";
   
         } 

         if(x > 31 && x < 98 && y > 299 && y < 360) { 
           
           File f = FileOpen("portseup.txt", write); 
           
           f.PrintLn(portssetup.editBox1.contents);
           f.PrintLn(portssetup.editBox2.contents); 
           f.PrintLn(portssetup.sentString.contents);
           f.PrintLn(portssetup.recvString.contents);
           f.PrintLn(portssetup.editBox5.contents);
           f.PrintLn(portssetup.editBox6.contents);
           f.PrintLn(portssetup.editBox7.contents); 
           f.PrintLn(portssetup.editBox8.contents);
           f.PrintLn(portssetup.editBox9.contents);
           f.PrintLn(portssetup.editBox10.contents);  
           f.PrintLn(portssetup.editBox11.contents);
           f.PrintLn(portssetup.editBox12.contents); 
           f.PrintLn(portssetup.editBox13.contents);
           f.PrintLn(portssetup.editBox14.contents);
           f.PrintLn(portssetup.editBox15.contents);  
           f.PrintLn(portssetup.editBox16.contents);
           f.PrintLn(portssetup.editBox17.contents); 
           f.PrintLn(portssetup.editBox18.contents);
           f.PrintLn(portssetup.editBox19.contents);
           f.PrintLn(portssetup.editBox20.contents);                     
            
           delete f;
           }                   
      
         if(x > 33 && x < 98 && y > 301 && y < 361) { portssetup.picture21.visible = true; } 
         if(x > 27 && x < 110 && y > 36 && y < 160) {  
         
   File f = FileOpen(":dot.html", read); mainpanel.htmlview1.OpenFile(f, null); 
 
   socket1.DatagramHost(atoi(portssetup.editBox5.contents)); 
   socket2.DatagramHost(atoi(portssetup.editBox6.contents)); 
   socket3.DatagramHost(atoi(portssetup.editBox7.contents)); 
   socket4.DatagramHost(atoi(portssetup.editBox8.contents)); 
   socket5.DatagramHost(atoi(portssetup.editBox9.contents)); 
   socket6.DatagramHost(atoi(portssetup.editBox10.contents)); 
   socket7.DatagramHost(atoi(portssetup.editBox11.contents)); 
   socket8.DatagramHost(atoi(portssetup.editBox12.contents));
   
   socket9.DatagramHost(atoi(portssetup.editBox13.contents));  
   socket10.DatagramHost(atoi(portssetup.editBox14.contents)); 
   socket11.DatagramHost(atoi(portssetup.editBox15.contents)); 
   socket12.DatagramHost(atoi(portssetup.editBox16.contents)); 
   socket13.DatagramHost(atoi(portssetup.editBox17.contents)); 
   socket14.DatagramHost(atoi(portssetup.editBox18.contents)); 
   socket15.DatagramHost(atoi(portssetup.editBox19.contents));
   socket16.DatagramHost(atoi(portssetup.editBox20.contents));


   socket1.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox13.contents) ); //50001 connect to 60001
   socket2.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox14.contents) ); //50002 connect to 60002
   socket3.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox15.contents) ); //50003 connect to 60003
   socket4.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox16.contents) ); //50004 connect to 60004
   socket5.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox17.contents) ); //50005 connect to 60005
   socket6.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox18.contents) ); //50006 connect to 60006
   socket7.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox19.contents) ); //50007 connect to 60007
   socket8.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox20.contents) ); //50008 connect to 60008  

/* socket9.DatagramConnect(portssetup.serverAddress.contents,  atoi(portssetup.editBox5.contents) );  //60001 connect to 50001
   socket10.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox6.contents) );  //60002 connect to 50002
   socket11.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox7.contents) );  //60003 connect to 50003
   socket12.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox8.contents) );  //60004 connect to 50004
   socket13.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox9.contents) );  //60005 connect to 50005
   socket14.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox10.contents) ); //60006 connect to 50006
   socket15.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox11.contents) ); //60007 connect to 50007
   socket16.DatagramConnect(portssetup.serverAddress.contents, atoi(portssetup.editBox12.contents) ); //60008 connect to 50008 */ 
   
  
   service.Start();       //port 40001 
   sockettxrx.btnListen;
   sockettxrx.btnConnect;
  // Connect();

   mainpanel.picture28.visible = true;
   mainpanel.picture29.visible = false;  
   portssetup.picture20.visible = true;

   portssetup.Destroy(0);
    
         }
          
         return true; 
      }

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) { portssetup.Destroy(0); }           
            if(x > 102 && x < 118 && y > 380 && y < 396) {  info.Create();  }
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture26.visible = false;
 
         if(x > 100 && x < 120 && y > 41 && y < 160) { portssetup.picture20.visible = false; } //connect   
         if(x > 24 && x < 100 && y > 20 && y < 41)   { portssetup.picture20.visible = false; }        
         if(x > 24 && x < 100 && y > 160 && y < 180) { portssetup.picture20.visible = false; }    
         if(x > 10 && x < 24 && y > 41 && y < 160)   { portssetup.picture20.visible = false; }
           
         if(x > 114 && x < 120 && y > 302 && y < 391){ portssetup.picture21.visible = false; }  //save 
         if(x > 20 && x < 120 && y > 280 && y < 301) { portssetup.picture21.visible = false; }        
         if(x > 20 && x < 120 && y > 362 && y < 391) { portssetup.picture21.visible = false; }    
         if(x > 20 && x < 28 && y > 301 && y < 381)  { portssetup.picture21.visible = false; }  

         if(x > 384 && x < 394 && y > 113 && y < 150){ portssetup.picture22.visible = false; }  //reset 
         if(x > 340 && x < 384 && y > 100 && y < 113){ portssetup.picture22.visible = false; }        
         if(x > 340 && x < 384 && y > 150 && y < 160){ portssetup.picture22.visible = false; }    
         if(x > 320 && x < 340 && y > 113 && y < 150){ portssetup.picture22.visible = false; }  

         return true;
      }
   }
   Picture picture2  { this, caption = "picture2",  position = { 220, 175 }, visible = true, image = { ":dot.png" } };
   Picture picture3  { this, caption = "picture3",  position = { 220, 200 }, visible = true, image = { ":dot.png" } };
   Picture picture4  { this, caption = "picture4",  position = { 220, 225 }, visible = true, image = { ":dot.png" } };
   Picture picture5  { this, caption = "picture5",  position = { 220, 250 }, visible = true, image = { ":dot.png" } };
   Picture picture6  { this, caption = "picture6",  position = { 220, 275 }, visible = true, image = { ":dot.png" } };
   Picture picture7  { this, caption = "picture7",  position = { 220, 300 }, visible = true, image = { ":dot.png" } };
   Picture picture8  { this, caption = "picture8",  position = { 220, 325 }, visible = true, image = { ":dot.png" } };
   Picture picture9  { this, caption = "picture9",  position = { 220, 350 }, visible = true, image = { ":dot.png" } };
   Picture picture10 { this, caption = "picture10", position = { 320, 175 }, visible = true, image = { ":dot.png" } };
   Picture picture11 { this, caption = "picture11", position = { 320, 200 }, visible = true, image = { ":dot.png" } };
   Picture picture12 { this, caption = "picture12", position = { 320, 225 }, visible = true, image = { ":dot.png" } };
   Picture picture13 { this, caption = "picture13", position = { 320, 250 }, visible = true, image = { ":dot.png" } };
   Picture picture14 { this, caption = "picture14", position = { 320, 275 }, visible = true, image = { ":dot.png" } };
   Picture picture15 { this, caption = "picture15", position = { 320, 300 }, visible = true, image = { ":dot.png" } };
   Picture picture16 { this, caption = "picture16", position = { 320, 325 }, visible = true, image = { ":dot.png" } };
   Picture picture17 { this, caption = "picture17", position = { 320, 350 }, visible = true, image = { ":dot.png" } };
   Picture picture18 { this, caption = "picture18", position = { 130, 175 }, visible = true, image = { ":dot.png" } };
   Picture picture19 { this, caption = "picture19", position = { 130, 225 }, visible = true, image = { ":dot.png" } };
   Picture picture20 { this, caption = "picture20", position = { 19, 37 }, visible = false, image = { ":p2p-connect.png" } };
   Picture picture21 { this, caption = "picture21", position = { 31, 299  }, visible = false, image = { ":save-settings.png" } };
   Picture picture22 { this, caption = "picture22", position = { 334, 104  }, visible = false, image = { ":reset-over.png" } };
   Label label1 { this, caption = "Note! do not change this unless you want to make unique chat clients", foreground = white, background = black, position = { 10, 10  },font = { "Brush Script Std", 10} };
   Label label2 { this, caption = "Recieve String", foreground = white, background = black, position = { 20, 235 },font = { "Brush Script Std", 10} };
   Label label3 { this, caption = "TCP Ports", foreground = white, background = black, position = { 125, 140 },font = { "Brush Script Std", 10} };
   Label label4 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 125, 160 },font = { "Brush Script Std", 10} };
   Label label5 { this, caption = "Transmit (TX)", background = black, foreground = white, position = { 125, 210 },font = { "Brush Script Std", 10} };
   Label label6 { this, caption = "UDP Ports", foreground = white, background = black, position = { 220, 140 },font = { "Brush Script Std", 10} };
   Label label7 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 220, 160 },font = { "Brush Script Std", 10} };
   Label label8 { this, caption = "Transmit (TX)", foreground = white, background = black, position = { 310, 160 },font = { "Brush Script Std", 10} };
   Label label9 { this, caption = "Send String", foreground = white, background = black, position = { 20, 185 },font = { "Brush Script Std", 10} };
   Label lblServerAddress { this, background = black, foreground = white, position = { 125, 90 }, labeledWindow = serverAddress, font = { "Brush Script Std", 10} };
   EditBox serverAddress { this, text = "Connect to", background = white, foreground = green, size = { 120, 20 }, position = { 125, 105 }, contents = "localhost", selectionColor = red };
   Label lblServerPort { this, background = black, foreground = white, position = { 260, 90 }, labeledWindow = serverPort, font = { "Brush Script Std", 10} };
   EditBox serverPort { this, text = "My Server port", background = white, foreground = green, size = { 60, 20 }, position = { 260, 105 }, contents = "40003", selectionColor = red };
   EditBox editBox1  { this, caption = "editBox1", background = white, foreground = green,  contents = "40001", position = { 150, 175 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox2  { this, caption = "editBox2", background = white, foreground = green,  contents = "40002", position = { 150, 225 }, size = { 50,20 }, selectionColor = red };
   EditBox sentString  { this, caption = "Sent String", background = white, foreground = green,  contents = "00000111", position = { 20,  200 }, size = { 80,20 }, selectionColor = red };
   EditBox recvString  { this, caption = "Received String", background = white, foreground = green,  contents = "11100000", position = { 20,  250 }, size = { 80,20 }, selectionColor = red };
   EditBox editBox5  { this, caption = "editBox5", background = white, foreground = green,  contents = "50001", position = { 240, 175 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox6  { this, caption = "editBox6", background = white, foreground = green,  contents = "50002", position = { 240, 200 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox7  { this, caption = "editBox7", background = white, foreground = green,  contents = "50003", position = { 240, 225 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox8  { this, caption = "editBox8", background = white, foreground = green,  contents = "50004", position = { 240, 250 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox9  { this, caption = "editBox9", background = white, foreground = green,  contents = "50005", position = { 240, 275 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox10 { this, caption = "editBox10", background = white, foreground = green, contents = "50006", position = { 240, 300 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox11 { this, caption = "editBox11", background = white, foreground = green, contents = "50007", position = { 240, 325 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox12 { this, caption = "editBox12", background = white, foreground = green, contents = "50008", position = { 240, 350 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox13 { this, caption = "editBox13", background = white, foreground = green, contents = "60001", position = { 340, 175 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox14 { this, caption = "editBox14", background = white, foreground = green, contents = "60002", position = { 340, 200 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox15 { this, caption = "editBox15", background = white, foreground = green, contents = "60003", position = { 340, 225 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox16 { this, caption = "editBox16", background = white, foreground = green, contents = "60004", position = { 340, 250 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox17 { this, caption = "editBox17", background = white, foreground = green, contents = "60005", position = { 340, 275 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox18 { this, caption = "editBox18", background = white, foreground = green, contents = "60006", position = { 340, 300 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox19 { this, caption = "editBox19", background = white, foreground = green, contents = "60007", position = { 340, 325 }, size = { 50,20 }, selectionColor = red };
   EditBox editBox20 { this, caption = "editBox20", background = white, foreground = green, contents = "60008", position = { 340, 350 }, size = { 50,20 }, selectionColor = red };

   bool OnCreate(void)
   {
      portssetup.picture20.visible = false;
      portssetup.picture21.visible = false;

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        info.Destroy(0);
        
        tcpServer.Start();
        mainpanel.picture68.visible = true;
        mainpanel.picture65.visible = false; 

      return true;
   }
};
Portssetup portssetup { mainpanel, autoCreate = false; };
