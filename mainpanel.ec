import "ecere"
import "console"      
import "about"        
import "help"          
import "Sounds"        
import "enckey"        
import "changename"    
import "info"          
import "surfer" 
import "ports-setup"   
import "htmlParser"
import "HTMLView"
import "lines"
import "tables"
import "udp"
import "sockets"
import "online"        
import "offline"  

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


  // Socket::Send()

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
// alphaBlend = true;

   bool OnKeyDown(Key key, unichar ch)
      {
         if(key == escape) Destroy(0);
         return true;
      }

   HTMLView htmlview1 { picture1, this, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 815, top = 59, right = 35, bottom = 410 }, hasVertScroll = true };
   HTMLView htmlview2 { picture1, this, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 815, top = 354, right = 35, bottom = 95 }, hasVertScroll = true };
   HTMLView htmlview  { console,  this, inactive = true, opacity = 0, visible = true, borderStyle = none, anchor = { left = 0, top = 0, right = 0, bottom = 60 }, hasVertScroll = true };
   Console console
   {
      picture1, this, opacity = 0, editHeight = 56, drawBehind = true, size = { 490, 635 }, position = { 112, 72 }, editTextColor = white, font = { "Comic Sans MS", 10 }; 
      log.visible = false;  
      
       bool ProcessCommand(char * command)
       {
          String imgCode = "<img src=\"\">";
          String c = command, s;
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
                if(c != command)
                  delete c;
                c = s2;
             }
          }

          chatFile.Seek(0, end);
          chatFile.Seek(0, end);
          chatFile.PrintLn("<b>",changename.editBox.contents, "</b>: ");
          chatFile.Puts(c);
          chatFile.PrintLn("<BR>");
          chatFile.Seek(0,start);

          chatFile.Seek(0,start);
      
          mainpanel.htmlview.OpenFile(chatFile, null);

          mainpanel.htmlview.OnUnloadGraphics();   // This seems to be needed right now to properly load bitmaps
          mainpanel.htmlview.OnLoadGraphics();

          mainpanel.htmlview.scroll.y = mainpanel.htmlview.scrollArea.h;

          if(c != command)
            delete c;
         return false;
      }
   };
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
   ProgressBar progressBar1  { picture1, this, "progressBar1", inactive = true, opacity = 0, borderStyle = contour, size = { 585, 23 }, position = { 104, 42 };     };
   Picture picture1
   {
      this, caption = "picture1", inactive = false, position = {  }, image = { ":chat-window22.pcx", alphaBlend = true };

      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {

           if(x > 0 && x < 988 && y > 0 && y < 47) { mainpanel.MenuWindowMove(null, mods); }  //top       
           if(x > 0 && x < 988 && y > 700 && y < 736) { mainpanel.MenuWindowMove(null, mods); }  //bottom
           if(x > 0 && x < 30 && y > 60 && y < 700) { mainpanel.MenuWindowMove(null, mods); }  //left
           if(x > 956 && x < 988 && y > 60 && y < 700) { mainpanel.MenuWindowMove(null, mods); }  //right              
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture21.visible = false; }   //clear
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture22.visible = false; }   //file
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture23.visible = false; }   //send
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture24.visible = false; }   //changename
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture25.visible = false; }   //enc key
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture26.visible = false; }   //IPPorts
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture27.visible = false; }   //Sounds
//         if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture28.visible = false; }   //Connect
//         if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture29.visible = false; }   //Disconnect
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture30.visible = false; }   //Help           
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture31.visible = false; }   //About
           if(x > 0 && x < 988 && y > 0 && y < 736) { mainpanel.picture32.visible = false; }   //P2p-Browser 

         return true;
      }

      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
            if(x > 956 && x < 986 && y > 48 && y < 58)  { mainpanel.Destroy(0); portssetup.Destroy(0); about.Destroy(0); help.Destroy(0); sounds.Destroy(0); enckey.Destroy(0); changename.Destroy(0); surfer.Destroy(0);}
            if(x > 956 && x < 986 && y > 60 && y < 80)  { mainpanel.picture1.MenuWindowMinimize(null,mods);  }
            if(x > 34 && x < 100 && y > 79 && y < 103)  { changename.Create(); }                      
            if(x > 34 && x < 100 && y > 114 && y < 137) { enckey.Create(); }                                  
            if(x > 34 && x < 100 && y > 149 && y < 173) { portssetup.Create(); }                    
            if(x > 34 && x < 100 && y > 184 && y < 209) { sounds.Create(); }                                                                                                             
            if(x > 34 && x < 100 && y > 255 && y < 278) { offline.Create(); }                       
            if(x > 34 && x < 100 && y > 289 && y < 313) { help.Create(); }                           
            if(x > 34 && x < 100 && y > 324 && y < 348) { about.Create(); }                          
            if(x > 5  && x < 35  && y > 45  && y < 80)  { info.Create(); }                         
            if(x > 34 && x < 100 && y > 358 && y < 420) { surfer.Create(); }                                                  
            if(x > 615 && x < 658 && y > 673 && y < 700){ mainpanel.console.commandBox.Clear(); mainpanel.picture21.visible = true; }         
            if(x > 750 && x < 802 && y > 45 && y < 65)  { mainpanel.picture22.visible = true; } //file
            if(x > 696 && x < 746 && y > 45 && y < 65)  { mainpanel.picture23.visible = true; } //send
            if(x > 34 && x < 100 && y > 79 && y < 103)  { mainpanel.picture24.visible = true; } //changename
            if(x > 34 && x < 100 && y > 114 && y < 137) { mainpanel.picture25.visible = true; } //enckey 
            if(x > 34 && x < 100 && y > 149 && y < 173) { mainpanel.picture26.visible = true; } //IP / Ports
            if(x > 34 && x < 100 && y > 184 && y < 209) { mainpanel.picture27.visible = true; } //Sounds
//          if(x > 34 && x < 100 && y > 219 && y < 243) { mainpanel.picture28.visible = true; } //Connect
//          if(x > 34 && x < 100 && y > 255 && y < 278) { mainpanel.picture29.visible = true; } //Disconnect
            if(x > 34 && x < 100 && y > 289 && y < 313) { mainpanel.picture30.visible = true; } //Help
            if(x > 34 && x < 100 && y > 324 && y < 348) { mainpanel.picture31.visible = true; } //About 
            if(x > 34 && x < 100 && y > 358 && y < 420) { mainpanel.picture32.visible = true; } //p2pwebbrowser                  
            if(x > 0 && x < 518 && y > 700 && y < 750)  { about.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { help.Destroy(0); } 
            if(x > 0 && x < 518 && y > 700 && y < 750)  { sounds.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { enckey.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { changename.Destroy(0); }
            if(x > 0 && x < 518 && y > 700 && y < 750)  { info.Destroy(0); }   

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
//          if(x > 101 && x < 109 && y > 219 && y < 243){ mainpanel.picture28.visible = false; }  //Connect   
//          if(x > 34 && x < 100 && y > 210 && y < 219) { mainpanel.picture28.visible = false; }         
//          if(x > 34 && x < 100 && y > 243 && y < 250) { mainpanel.picture28.visible = false; }  
//          if(x > 25 && x < 33 && y > 219 && y < 243)  { mainpanel.picture28.visible = false; }   
//          if(x > 101 && x < 109 && y > 255 && y < 278){ mainpanel.picture29.visible = true;  }  //Disconnect  
//          if(x > 34 && x < 100 && y > 251 && y < 255) { mainpanel.picture29.visible = true;  }        
//          if(x > 34 && x < 100 && y > 278 && y < 283) { mainpanel.picture29.visible = true;  }   
//          if(x > 25 && x < 33 && y > 255 && y < 278)  { mainpanel.picture29.visible = true;  }              
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
Mainpanel mainpanel {};