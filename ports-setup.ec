import "ecere"  
import "mainpanel"
import "udp"
import "sockets"
import "sockets2"

class Portssetup : Window
{
   caption = "Ports Setup";
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
   
   mainpanel.picture28.visible = true;
   mainpanel.picture29.visible = false;  
  
   service.Start();
   service2.Start();
  // mysocket1.listening = true; 
   //mysocket2.listening = true;
   
   portssetup.Destroy(0);

         }
          
         return true; 
      }

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 132 && x < 146 && y > 380 && y < 396) { portssetup.Destroy(0); }           
          
         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         mainpanel.picture26.visible = false;
 
         if(x > 98 && x < 120 && y > 18 && y < 183)  { portssetup.picture20.visible = false; } //connect   
         if(x > 20 && x < 120 && y > 18 && y < 38)   { portssetup.picture20.visible = false; }        
         if(x > 20 && x < 120 && y > 163 && y < 183) { portssetup.picture20.visible = false; }    
         if(x > 20 && x < 33 && y > 18 && y < 183)   { portssetup.picture20.visible = false; }
           
         if(x > 114 && x < 120 && y > 302 && y < 391){ portssetup.picture21.visible = false; }  //save 
         if(x > 20 && x < 120 && y > 280 && y < 301) { portssetup.picture21.visible = false; }        
         if(x > 20 && x < 120 && y > 362 && y < 391) { portssetup.picture21.visible = false; }    
         if(x > 20 && x < 28 && y > 301 && y < 381)  { portssetup.picture21.visible = false; }  

         return true;
      }
   }
   Picture picture2  { this, caption = "picture2",  position = { 135, 175 }, visible = true, image = { ":dot.png" } };
   Picture picture3  { this, caption = "picture3",  position = { 135, 200 }, visible = true, image = { ":dot.png" } };
   Picture picture4  { this, caption = "picture4",  position = { 135, 225 }, visible = true, image = { ":dot.png" } };
   Picture picture5  { this, caption = "picture5",  position = { 135, 250 }, visible = true, image = { ":dot.png" } };
   Picture picture6  { this, caption = "picture6",  position = { 135, 275 }, visible = true, image = { ":dot.png" } };
   Picture picture7  { this, caption = "picture7",  position = { 135, 300 }, visible = true, image = { ":dot.png" } };
   Picture picture8  { this, caption = "picture8",  position = { 135, 325 }, visible = true, image = { ":dot.png" } };
   Picture picture9  { this, caption = "picture9",  position = { 135, 350 }, visible = true, image = { ":dot.png" } };
   Picture picture10 { this, caption = "picture10", position = { 265, 175 }, visible = true, image = { ":dot.png" } };
   Picture picture11 { this, caption = "picture11", position = { 265, 200 }, visible = true, image = { ":dot.png" } };
   Picture picture12 { this, caption = "picture12", position = { 265, 225 }, visible = true, image = { ":dot.png" } };
   Picture picture13 { this, caption = "picture13", position = { 265, 250 }, visible = true, image = { ":dot.png" } };
   Picture picture14 { this, caption = "picture14", position = { 265, 275 }, visible = true, image = { ":dot.png" } };
   Picture picture15 { this, caption = "picture15", position = { 265, 300 }, visible = true, image = { ":dot.png" } };
   Picture picture16 { this, caption = "picture16", position = { 265, 325 }, visible = true, image = { ":dot.png" } };
   Picture picture17 { this, caption = "picture17", position = { 265, 350 }, visible = true, image = { ":dot.png" } };
   Picture picture18 { this, caption = "picture18", position = { 135, 100 }, visible = true, image = { ":dot.png" } };
   Picture picture19 { this, caption = "picture19", position = { 265, 100 }, visible = true, image = { ":dot.png" } };
   Picture picture20 { this, caption = "picture20", position = { 28, 36 }, visible = false, image = { ":p2p-connect.png" } };
   Picture picture21 { this, caption = "picture21", position = { 31, 299  }, visible = false, image = { ":save-settings.png" } };
   
   Label label1 { this, caption = "Note! do not change this unless you want to make unique chat clients", foreground = white, background = black, position = { 10, 10  } };
   Label label2 { this, caption = "Recieve String", foreground = white, background = black, position = { 20, 235 } };
   Label label3 { this, caption = "TCP Ports", foreground = white, background = black, position = { 150, 67 } };
   Label label4 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 150, 85 } };
   Label label5 { this, caption = "Transmit (TX)", background = black, foreground = white, position = { 280, 85 } };
   Label label6 { this, caption = "UDP Ports", foreground = white, background = black, position = { 150, 140 } };
   Label label7 { this, caption = "Recieve (RX)", foreground = white, background = black, position = { 150, 160 } };
   Label label8 { this, caption = "Transmit (TX)", foreground = white, background = black, position = { 280, 160 } };
   Label label9 { this, caption = "Send String", foreground = white, background = black, position = { 20, 185 } };

   EditBox serverAddress { this, text = "Server Address", size = { 120, 20 }, position = { 150, 40 }, contents = "localhost" };
   Label lblServerAddress { this, background = black, foreground = white, position = { 150, 25 }, labeledWindow = serverAddress };
  
   EditBox editBox1  { this, caption = "editBox1",  contents = "40001", position = { 150, 100 } };
   EditBox editBox2  { this, caption = "editBox2",  contents = "40002", position = { 280, 100 } };
   EditBox sentString  { this, caption = "Sent String",  contents = "00000111", position = { 20,  200 } };
   EditBox recvString  { this, caption = "Received String",  contents = "11100000", position = { 20,  250 } };
   EditBox editBox5  { this, caption = "editBox5",  contents = "50001", position = { 150, 175 } };
   EditBox editBox6  { this, caption = "editBox6",  contents = "50002", position = { 150, 200 } };
   EditBox editBox7  { this, caption = "editBox7",  contents = "50003", position = { 150, 225 } };
   EditBox editBox8  { this, caption = "editBox8",  contents = "50004", position = { 150, 250 } };
   EditBox editBox9  { this, caption = "editBox9",  contents = "50005", position = { 150, 275 } };
   EditBox editBox10 { this, caption = "editBox10", contents = "50006", position = { 150, 300 } };
   EditBox editBox11 { this, caption = "editBox11", contents = "50007", position = { 150, 325 } };
   EditBox editBox12 { this, caption = "editBox12", contents = "50008", position = { 150, 350 } };
   EditBox editBox13 { this, caption = "editBox13", contents = "60001", position = { 280, 175 } };
   EditBox editBox14 { this, caption = "editBox14", contents = "60002", position = { 280, 200 } };
   EditBox editBox15 { this, caption = "editBox15", contents = "60003", position = { 280, 225 } };
   EditBox editBox16 { this, caption = "editBox16", contents = "60004", position = { 280, 250 } };
   EditBox editBox17 { this, caption = "editBox17", contents = "60005", position = { 280, 275 } };
   EditBox editBox18 { this, caption = "editBox18", contents = "60006", position = { 280, 300 } };
   EditBox editBox19 { this, caption = "editBox19", contents = "60007", position = { 280, 325 } };
   EditBox editBox20 { this, caption = "editBox20", contents = "60008", position = { 280, 350 } };

   bool OnCreate(void)
   {
      portssetup.picture20.visible = false;
      portssetup.picture21.visible = false;

        about.Destroy(0);
        enckey.Destroy(0);
        help.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        surfer.Destroy(0); 
        info.Destroy(0);

      return true;
   }
};
Portssetup portssetup { mainpanel, autoCreate = false; };
