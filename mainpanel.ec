public import "ecere"
import "console"      
import "about"        
import "help"          
import "Sounds"        
import "enckey"        
import "changename"    
import "info"          
import "ports-setup"   
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"
import "online"        
import "offline"  
import "server"
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
import "smtp"
import "md5"
import "sha256"
import "CheckListBox"  
import "passwordBox"

TempFile chatFile { };

Map<String, String> smileys
{ [
   { ":)", ":smiley1.png" },
   { ";)", ":smiley3.png" },
   { ":haha", ":smiley19.png"},
   { ":dead", ":smiley18.png"},
   { ":disgust", ":smiley17.png"},
   { ":tired", ":smiley16.png"},
   { ":cheeky", ":smiley15.png"},
   { ":cry", ":smiley14.png"},
   { ":sick", ":smiley13.png"},
   { ":$", ":smiley12.png"},
   { ":cool", ":smiley11.png"},
   { ":D", ":smiley10.png"},
   { ":S", ":smiley9.png" },
   { ":P", ":smiley8.png" },
   { ":O", ":smiley7.png" },
   { ":confused", ":smiley6.png" },
   { ":<", ":smiley5.png" },
   { ":/", ":smiley4.png" },
   { ";)", ":smiley3.png" },
   { ":(", ":smiley2.png" },
   { ":)", ":smiley1.png" }
] };

 class MyApp : GuiApplication
 {
    skin = "My";
 }


class Mainpanel : Window
{
   caption = "Mainpanel";
   background = black;
   opacity = 0;
   interim = true;
   size = { 988, 734 };
   anchor = { horz = -188, vert = -11 };
   moveable = true;  
   fullRender = true;
// alphaBlend = true;

   bool OnKeyDown(Key key, unichar ch)
      {
         if(key == escape) Destroy(0);
         return true;
      }

   HTMLView htmlview1 { picture1, this, dontHideScroll =true, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 816, top = 56, right = 34, bottom = 413 }, hasVertScroll = true };
   HTMLView htmlview2 { picture1, this, dontHideScroll =true, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 815, top = 354, right = 35, bottom = 95 }, hasVertScroll = true }; 
   HTMLView htmlview  { console,  this, dontHideScroll =true, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 0, top = 0, right = 0, bottom = 60 }, hasVertScroll = true };
   void AddMessage(String name, String msg)
   {
       String imgCode = "<img src=\"\">";
       String c = msg, s;
       for(smile : smileys)
       {
          // Replace the emoticon by HTML image tag
          while(s = strstr(c, &smile))
          {
             String s2 = new char[(s - c) + strlen(smile) + strlen(imgCode) + strlen(s + strlen(&smile)) + 1];
             memcpy(s2, c, (uint)(s - c));
             memcpy(s2 + (s-c), imgCode, strlen(imgCode)-2);
             memcpy(s2 + (s-c) + strlen(imgCode)-2, smile, strlen(smile));
             memcpy(s2 + (s-c) + strlen(imgCode)-2 + strlen(smile), imgCode + strlen(imgCode)-2, 2);
             memcpy(s2 + (s-c) + strlen(smile) + strlen(imgCode), s + strlen(&smile), strlen(s + strlen(&smile)));
             s2[(s-c) + strlen(smile) + strlen(imgCode) + strlen(s + strlen(&smile))] = 0;
             if(c != msg)
                delete c;
             c = s2;
          }
       }

       chatFile.Seek(0, end);
       chatFile.PrintLn("<b>", name, "</b>: ");
       chatFile.Puts(c);
       chatFile.PrintLn("<BR>");
       chatFile.Seek(0,start);

       mainpanel.htmlview.OpenFile(chatFile, null);
       mainpanel.htmlview.OnUnloadGraphics();   // This seems to be needed right now to properly load bitmaps
       mainpanel.htmlview.OnLoadGraphics();
       mainpanel.htmlview.scroll.y = mainpanel.htmlview.scrollArea.h;

       if(c != msg)
          delete c;
   }
   Console console
   {
      picture1, this, opacity = 0, editHeight = 56, drawBehind = true, size = { 490, 635 }, position = { 112, 72 }, editTextColor = white, font = { "Comic Sans MS", 10 }; 
      log.visible = false;  
      
       bool ProcessCommand(char * command)
       {
          thissocket.SendMessage(changename.editBox.contents, command);
          mainpanel.AddMessage(changename.editBox.contents, command);
          return false;
       }
   };
   Label label1 { picture1, this, "Port1(RX)", position = { 642, 120 },font = { "Brush Script Std", 10} };
   Label label2 { picture1, this, "Port2", position = { 642, 140 },font = { "Brush Script Std", 10} };
   Label label3 { picture1, this, "Port3", position = { 642, 160 },font = { "Brush Script Std", 10} };
   Label label4 { picture1, this, "Port4", position = { 642, 180 },font = { "Brush Script Std", 10} };
   Label label5 { picture1, this, "Port5", position = { 642, 200 },font = { "Brush Script Std", 10} };
   Label label6 { picture1, this, "Port6", position = { 642, 220 },font = { "Brush Script Std", 10} };
   Label label7 { picture1, this, "Port7", position = { 642, 240 },font = { "Brush Script Std", 10} };
   Label label8 { picture1, this, "Port8", position = { 642, 260 },font = { "Brush Script Std", 10} };
   Label label9 { picture1, this, "Port9(TX)", position = { 726, 120 },font = { "Brush Script Std", 10} };
   Label labe20 { picture1, this, "Port10", position = { 726, 140 },font = { "Brush Script Std", 10} };
   Label labe21 { picture1, this, "Port11", position = { 726, 160 },font = { "Brush Script Std", 10} };
   Label labe22 { picture1, this, "Port12", position = { 726, 180 },font = { "Brush Script Std", 10} };
   Label labe23 { picture1, this, "Port13", position = { 726, 200 },font = { "Brush Script Std", 10} };
   Label labe24 { picture1, this, "Port14", position = { 726, 220 },font = { "Brush Script Std", 10} };
   Label labe25 { picture1, this, "Port15", position = { 726, 240 },font = { "Brush Script Std", 10} };
   Label labe26 { picture1, this, "Port16", position = { 726, 260 },font = { "Brush Script Std", 10} };
   Label labe27 { picture1, this, "UDP PORTS", position = { 622, 100 },font = { "Brush Script Std", 10} };
   Label labe28 { picture1, this, "TCP PORTS", position = { 622, 280 },font = { "Brush Script Std", 10} };
   Label labe29 { picture1, this, "Port1", position = { 638, 300 },font = { "Brush Script Std", 10} };
   Label labe30 { picture1, this, "Port2", position = { 722, 300 },font = { "Brush Script Std", 10} };
   Label labe31 { picture1, this, "TCP SERVER", position = { 642, 320 },font = { "Brush Script Std", 10} };
   Picture picture70 { picture1, this, "picture70", size = { 8, 8 }, position = { 622, 300 }, visible = false, image = { ":dot.png" } }; //port1
   Picture picture69 { picture1, this, "picture69", size = { 8, 8 }, position = { 706, 300 }, visible = false, image = { ":dot.png" } }; //port2
   Picture picture68 { picture1, this, "picture68", size = { 8, 8 }, position = { 622, 320 }, visible = false, image = { ":dot.png" } }; //tcp server
   Picture picture67 { picture1, this, "picture67", size = { 8, 8 }, position = { 622, 300 }, visible = true, image = { ":dotr.png" } }; //port1 tcp
   Picture picture66 { picture1, this, "picture66", size = { 8, 8 }, position = { 706, 300 }, visible = true, image = { ":dotr.png" } }; //port2 tcp
   Picture picture65 { picture1, this, "picture65", size = { 8, 8 }, position = { 622, 320 }, visible = true, image = { ":dotr.png" } }; //tcp server
   Picture picture64 { picture1, this, "picture64", size = { 8, 8 }, position = { 706, 260 }, visible = false, image = { ":dot.png" } };//port16
   Picture picture63 { picture1, this, "picture63", size = { 8, 8 }, position = { 706, 240 }, visible = false, image = { ":dot.png" } };
   Picture picture62 { picture1, this, "picture62", size = { 8, 8 }, position = { 706, 220 }, visible = false, image = { ":dot.png" } };
   Picture picture61 { picture1, this, "picture61", size = { 8, 8 }, position = { 706, 200 }, visible = false, image = { ":dot.png" } };
   Picture picture60 { picture1, this, "picture60", size = { 8, 8 }, position = { 706, 180 }, visible = false, image = { ":dot.png" } };
   Picture picture59 { picture1, this, "picture59", size = { 8, 8 }, position = { 706, 160 }, visible = false, image = { ":dot.png" } };
   Picture picture58 { picture1, this, "picture58", size = { 8, 8 }, position = { 706, 140 }, visible = false, image = { ":dot.png" } };
   Picture picture57 { picture1, this, "picture57", size = { 8, 8 }, position = { 706, 120 }, visible = false, image = { ":dot.png" } };
   Picture picture56 { picture1, this, "picture56", size = { 8, 8 }, position = { 622, 260 }, visible = false, image = { ":dot.png" } };//port8
   Picture picture55 { picture1, this, "picture55", size = { 8, 8 }, position = { 622, 240 }, visible = false, image = { ":dot.png" } };
   Picture picture54 { picture1, this, "picture54", size = { 8, 8 }, position = { 622, 220 }, visible = false, image = { ":dot.png" } };
   Picture picture53 { picture1, this, "picture53", size = { 8, 8 }, position = { 622, 200 }, visible = false, image = { ":dot.png" } };
   Picture picture52 { picture1, this, "picture52", size = { 8, 8 }, position = { 622, 180 }, visible = false, image = { ":dot.png" } };
   Picture picture51 { picture1, this, "picture51", size = { 8, 8 }, position = { 622, 160 }, visible = false, image = { ":dot.png" } };
   Picture picture50 { picture1, this, "picture50", size = { 8, 8 }, position = { 622, 140 }, visible = false, image = { ":dot.png" } };
   Picture picture49 { picture1, this, "picture49", size = { 8, 8 }, position = { 622, 120 }, visible = false, image = { ":dot.png" } }; //port1
   Picture picture48 { picture1, this, "picture48", size = { 8, 8 }, position = { 706, 260 }, visible = true, image = { ":dotr.png" } }; //port16
   Picture picture47 { picture1, this, "picture47", size = { 8, 8 }, position = { 706, 240 }, visible = true, image = { ":dotr.png" } };
   Picture picture46 { picture1, this, "picture46", size = { 8, 8 }, position = { 706, 220 }, visible = true, image = { ":dotr.png" } };
   Picture picture45 { picture1, this, "picture45", size = { 8, 8 }, position = { 706, 200 }, visible = true, image = { ":dotr.png" } };
   Picture picture44 { picture1, this, "picture44", size = { 8, 8 }, position = { 706, 180 }, visible = true, image = { ":dotr.png" } };
   Picture picture43 { picture1, this, "picture43", size = { 8, 8 }, position = { 706, 160 }, visible = true, image = { ":dotr.png" } };
   Picture picture42 { picture1, this, "picture42", size = { 8, 8 }, position = { 706, 140 }, visible = true, image = { ":dotr.png" } };
   Picture picture41 { picture1, this, "picture41", size = { 8, 8 }, position = { 706, 120 }, visible = true, image = { ":dotr.png" } };
   Picture picture40 { picture1, this, "picture40", size = { 8, 8 }, position = { 622, 260 }, visible = true, image = { ":dotr.png" } };//port8
   Picture picture39 { picture1, this, "picture39", size = { 8, 8 }, position = { 622, 240 }, visible = true, image = { ":dotr.png" } };
   Picture picture38 { picture1, this, "picture38", size = { 8, 8 }, position = { 622, 220 }, visible = true, image = { ":dotr.png" } };
   Picture picture37 { picture1, this, "picture37", size = { 8, 8 }, position = { 622, 200 }, visible = true, image = { ":dotr.png" } };
   Picture picture36 { picture1, this, "picture36", size = { 8, 8 }, position = { 622, 180 }, visible = true, image = { ":dotr.png" } };
   Picture picture35 { picture1, this, "picture35", size = { 8, 8 }, position = { 622, 160 }, visible = true, image = { ":dotr.png" } };
   Picture picture34 { picture1, this, "picture34", size = { 8, 8 }, position = { 622, 140 }, visible = true, image = { ":dotr.png" } };
   Picture picture33 { picture1, this, "picture33", size = { 8, 8 }, position = { 622, 120 }, visible = true, image = { ":dotr.png" } };//port1
   Picture picture32 { picture1, this, "p2pweb", position = { 35, 359  },  visible = false,  image = { ":p2pweb.png" } };
   Picture picture31 { picture1, this, "About_over", position = { 35, 324  },  visible = false,  image = { ":about_over.png" } };
   Picture picture30 { picture1, this, "Help_over", position = { 35, 289  },  visible = false,  image = { ":help_over.png" } };
   Picture picture29 { picture1, this, "Disconnect_over", position = { 35, 255  },  visible = true,  image = { ":disconnect_over.png" } };
   Picture picture28 { picture1, this, "Connect_over", position = { 35, 219  },  visible = false,  image = { ":connect_over.png" } };
   Picture picture27 { picture1, this, "Sounds_over", position = { 35, 184  },  visible = false,  image = { ":sounds_over.png" } };
   Picture picture26 { picture1, this, "IPPorts_over", position = { 35, 149  },  visible = false,  image = { ":IPPorts_over.png" } };
   Picture picture25 { picture1, this, "enckey_over", position = { 35, 114  },  visible = false,  image = { ":enckey_over.png" } };
   Picture picture24 { picture1, this, "nickname_over", position = { 35, 79   },  visible = false,  image = { ":nickname_over.png" } };
   Picture picture23 { picture1, this, "send_over", position = { 695, 44  },  visible = false,  image = { ":send_over.gif" } };
   Picture picture22 { picture1, this, "file_over", position = { 750, 44  },  visible = false,  image = { ":file_over.gif" } };
   Picture picture21 { picture1, this, "clear_over", position = { 615, 669 },  visible = false,  image = { ":clear_over.gif" } };

   bool SmileyClicked(Button button, int x, int y, Modifiers mods)
   {
      console.commandBox.PutS(button.toolTip);
      return true;
   }
   Button picture20 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 936, 680 },toolTip = " :haha ", bitmap = { smileys[":haha"] }; NotifyClicked = SmileyClicked };
   Button picture19 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 912, 680 },toolTip = " :dead  ", bitmap = { smileys[":dead"] }; NotifyClicked = SmileyClicked };
   Button picture18 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 888, 680 },toolTip = " :disgust ", bitmap = { smileys[":disgust"] }; NotifyClicked = SmileyClicked };
   Button picture17 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 864, 680 },toolTip = " :tired ", bitmap = { smileys[":tired"] }; NotifyClicked = SmileyClicked };
   Button picture16 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 840, 680 },toolTip = " :cheeky ", bitmap = { smileys[":cheeky"] }; NotifyClicked = SmileyClicked };
   Button picture15 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 816, 680 },toolTip = " :cry ", bitmap = { smileys[":cry"] }; NotifyClicked = SmileyClicked };
   Button picture14 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 792, 680 },toolTip = " :sick ", bitmap = { smileys[":sick"] }; NotifyClicked = SmileyClicked };
   Button picture13 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 768, 680 },toolTip = " :$ ", bitmap = { smileys[":$"] }; NotifyClicked = SmileyClicked };
   Button picture12 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 744, 680 },toolTip = " :cool ", bitmap = { smileys[":cool"] }; NotifyClicked = SmileyClicked };
   Button picture11 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 720, 680 },toolTip = " :D ", bitmap = { smileys[":D"] }; NotifyClicked = SmileyClicked };
   Button picture10 { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 696, 680 },toolTip = " :S ", bitmap = { smileys[":S"] }; NotifyClicked = SmileyClicked };
   Button picture9  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 864, 656 },toolTip = " :P ", bitmap = { smileys[":P"] }; NotifyClicked = SmileyClicked };
   Button picture8  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 840, 656 },toolTip = " :O ", bitmap = { smileys[":O"] }; NotifyClicked = SmileyClicked };
   Button picture7  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 816, 656 },toolTip = " :confused ", bitmap = { smileys[":confused"] }; NotifyClicked = SmileyClicked };
   Button picture6  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 792, 656 },toolTip = " :< ", bitmap = { smileys[":<"] }; NotifyClicked = SmileyClicked };
   Button picture5  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 768, 656 },toolTip = " :/ ", bitmap = { smileys[":/"] }; NotifyClicked = SmileyClicked };
   Button picture4  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 744, 656 },toolTip = " ;) ", bitmap = { smileys[";)"] }; NotifyClicked = SmileyClicked };
   Button picture3  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 720, 656 },toolTip = " :( ", bitmap = { smileys[":("] }; NotifyClicked = SmileyClicked };
   Button picture2  { picture1, this, bevelOver = true, inactive = true,size = { 22, 22 }, opacity = 0,position = { 696, 656 },toolTip = " :) ", bitmap = { smileys[":)"] }; NotifyClicked = SmileyClicked };
   ProgressBar progressBar1  { picture1, this, "progressBar1", inactive = true, opacity = 0, borderStyle = contour, size = { 585, 23 }, position = { 104, 42 } };
   Picture picture1
   {
      this, anchor = { 0,0,0,0 },caption = "picture1", inactive = false, image = { ":chat-window22.pcx", alphaBlend = true };

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {

           if(x > 0 && x < 988 && y > 0 && y < 26)     { mainpanel.MenuWindowMove(null, mods); }  //top       
           if(x > 0 && x < 988 && y > 700 && y < 736)  { mainpanel.MenuWindowMove(null, mods); }  //bottom
           if(x > 0 && x < 10 && y > 60 && y < 700)    { mainpanel.MenuWindowMove(null, mods); }  //left
           if(x > 978 && x < 988 && y > 60 && y < 700) { mainpanel.MenuWindowMove(null, mods); }  //right
           if(x > 604 && x < 806 && y > 72 && y < 646) { mainpanel.MenuWindowMove(null, mods); }  //main window
                         
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture21.visible = false; }   //clear
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture22.visible = false; }   //file
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture23.visible = false; }   //send
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture24.visible = false; }   //changename
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture25.visible = false; }   //enc key
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture26.visible = false; }   //IPPorts
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture27.visible = false; }   //Sounds
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture30.visible = false; }   //Help           
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture31.visible = false; }   //About
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture32.visible = false; }   //P2p-Browser 

         return true;
      }

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 956 && x < 986 && y > 48 && y < 58)  { mainpanel.Destroy(0); portssetup.Destroy(0); about.Destroy(0); help.Destroy(0); info.Destroy(0); sounds.Destroy(0); enckey.Destroy(0); changename.Destroy(0);}
            if(x > 956 && x < 986 && y > 60 && y < 80)  { mainpanel.picture1.MenuWindowMinimize(null,mods);  }
            if(x > 34 && x < 100 && y > 79 && y < 103)  { changename.Create(); }                      
            if(x > 34 && x < 100 && y > 114 && y < 137) { enckey.Create(); }                                  
            if(x > 34 && x < 100 && y > 149 && y < 173) { portssetup.Create(); }                    
            if(x > 34 && x < 100 && y > 184 && y < 209) { sounds.Create(); }                                                                                                             
            if(x > 34 && x < 100 && y > 255 && y < 278) { offline.Create(); }                       
            if(x > 34 && x < 100 && y > 289 && y < 313) { help.Create(); }                           
            if(x > 34 && x < 100 && y > 324 && y < 348) { about.Create(); }                          
            if(x > 10  && x < 27  && y > 55  && y < 70) { info.Create(); }                         
//            if(x > 34 && x < 100 && y > 358 && y < 420) { webbrowser.Create(); }
            if(x > 751 && x < 802 && y > 63 && y < 45)  { FileDialog dlg { }; if(dlg.Modal() == ok) { /* dlg.filePath*/  } incref dlg; delete dlg;};                                   
            if(x > 615 && x < 658 && y > 673 && y < 700){ mainpanel.console.commandBox.Clear(); mainpanel.picture21.visible = true; }         
            if(x > 750 && x < 802 && y > 45 && y < 65)  { mainpanel.picture22.visible = true; } //file
            if(x > 696 && x < 746 && y > 45 && y < 65)  { mainpanel.picture23.visible = true; } //send
            if(x > 34 && x < 100 && y > 79 && y < 103)  { mainpanel.picture24.visible = true; } //changename
            if(x > 34 && x < 100 && y > 114 && y < 137) { mainpanel.picture25.visible = true; } //enckey 
            if(x > 34 && x < 100 && y > 149 && y < 173) { mainpanel.picture26.visible = true; } //IP / Ports
            if(x > 34 && x < 100 && y > 184 && y < 209) { mainpanel.picture27.visible = true; } //Sounds
            if(x > 34 && x < 100 && y > 289 && y < 313) { mainpanel.picture30.visible = true; } //Help
            if(x > 34 && x < 100 && y > 324 && y < 348) { mainpanel.picture31.visible = true; } //About 
            if(x > 34 && x < 100 && y > 358 && y < 420) { mainpanel.picture32.visible = true; } //p2pwebbrowser                  
            if(x > 0 && x < 518 && y > 700 && y < 750)  { about.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { help.Destroy(0); } 
            if(x > 0 && x < 518 && y > 700 && y < 750)  { sounds.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { enckey.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { changename.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { info.Destroy(0); }   
            if(x > 0 && x < 518 && y > 700 && y < 750)  { portssetup.Destroy(0); }

         return true;
      }

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
             
            if(x > 659 && x < 695 && y > 651 && y < 708){ mainpanel.picture21.visible = false; }  //clear button  //right 
            if(x > 616 && x < 657 && y > 651 && y < 673){ mainpanel.picture21.visible = false; }                  //top       
            if(x > 616 && x < 657 && y > 701 && y < 708){ mainpanel.picture21.visible = false; }                  //bottom 
            if(x > 607 && x < 616 && y > 651 && y < 708){ mainpanel.picture21.visible = false; }                  //left 
            if(x > 802 && x < 816 && y > 40 && y < 70)  { mainpanel.picture22.visible = false; }  //file button  
            if(x > 748 && x < 816 && y > 30 && y < 44)  { mainpanel.picture22.visible = false; }          
            if(x > 748 && x < 816 && y > 30 && y < 90)  { mainpanel.picture22.visible = false; }    
            if(x > 745 && x < 749 && y > 40 && y < 80)  { mainpanel.picture22.visible = false; }    
            if(x > 744 && x < 756 && y > 40 && y < 80)  { mainpanel.picture23.visible = false; }  //send button 
            if(x > 680 && x < 750 && y > 30 && y < 44)  { mainpanel.picture23.visible = false; }        
            if(x > 680 && x < 747 && y > 30 && y < 90)  { mainpanel.picture23.visible = false; }  
            if(x > 683 && x < 695 && y > 40 && y < 80)  { mainpanel.picture23.visible = false; }    
            if(x > 101 && x < 109 && y > 79 && y < 103) { mainpanel.picture24.visible = false; }  //changename  
            if(x > 34 && x < 100 && y > 70 && y < 79)   { mainpanel.picture24.visible = false; }         
            if(x > 34 && x < 100 && y > 105 && y < 109) { mainpanel.picture24.visible = false; }    
            if(x > 25 && x < 33 && y > 79 && y < 103)   { mainpanel.picture24.visible = false; }   
            if(x > 101 && x < 109 && y > 114 && y < 137){ mainpanel.picture25.visible = false; }  //enc key   
            if(x > 34 && x < 100 && y > 104 && y < 114) { mainpanel.picture25.visible = false; }          
            if(x > 34 && x < 100 && y > 140 && y < 143) { mainpanel.picture25.visible = false; }    
            if(x > 25 && x < 33 && y > 114 && y < 137)  { mainpanel.picture25.visible = false; }   
            if(x > 101 && x < 109 && y > 149 && y < 173){ mainpanel.picture26.visible = false; }  //IP / Ports  
            if(x > 34 && x < 100 && y > 140 && y < 149) { mainpanel.picture26.visible = false; }          
            if(x > 34 && x < 100 && y > 173 && y < 180) { mainpanel.picture26.visible = false; }    
            if(x > 25 && x < 33 && y > 149 && y < 173)  { mainpanel.picture26.visible = false; }   
            if(x > 101 && x < 109 && y > 184 && y < 209){ mainpanel.picture27.visible = false; }  //Sounds    
            if(x > 34 && x < 100 && y > 170 && y < 184) { mainpanel.picture27.visible = false; }         
            if(x > 34 && x < 100 && y > 209 && y < 229) { mainpanel.picture27.visible = false; }    
            if(x > 25 && x < 33 && y > 184 && y < 209)  { mainpanel.picture27.visible = false; }               
            if(x > 101 && x < 109 && y > 289 && y < 313){ mainpanel.picture30.visible = false; }  //Help  
            if(x > 34 && x < 100 && y > 284 && y < 289) { mainpanel.picture30.visible = false; }         
            if(x > 34 && x < 100 && y > 313 && y < 319) { mainpanel.picture30.visible = false; }    
            if(x > 25 && x < 33 && y > 289 && y < 313)  { mainpanel.picture30.visible = false; }   
            if(x > 101 && x < 109 && y > 324 && y < 348){ mainpanel.picture31.visible = false; }  //About   
            if(x > 34 && x < 100 && y > 320 && y < 324) { mainpanel.picture31.visible = false; }         
            if(x > 34 && x < 100 && y > 348 && y < 358) { mainpanel.picture31.visible = false; }    
            if(x > 25 && x < 33 && y > 324 && y < 348)  { mainpanel.picture31.visible = false; }           
            if(x > 101 && x < 109 && y > 358 && y < 440){ mainpanel.picture32.visible = false; }  //p2pwebbrowser 
            if(x > 34 && x < 100 && y > 350 && y < 358) { mainpanel.picture32.visible = false; }         
            if(x > 34 && x < 100 && y > 420 && y < 440) { mainpanel.picture32.visible = false; }  
            if(x > 25 && x < 33 && y > 358 && y < 440)  { mainpanel.picture32.visible = false; }    
                          
         return true;
      }
   }

   Mainpanel()
   {  
      chatFile.PrintLn("<BODY bgcolor=#00000000><b><FONT face\"Arial\" size=3 color=#000000>");
   }

   bool OnCreate(void)
   {    
   portssetup.Create();

      return true;
   }
};

Mainpanel mainpanel { };