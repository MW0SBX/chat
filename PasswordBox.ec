#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
import "mainpanel" 

class PasswordBox : EditBox
{ 
   caption = "Password";
   background = black;
   borderStyle = fixed;
   hasClose = false;
   stayOnTop = true;
   position = { 150, 150 };
   moveable = false; 
   foreground = white;

   font = { "Wingdings"/*"Webdings"*/, 16 };

   void OnRedraw(Surface surface)
   {
      EditLine l;
      int y, x1, x2;
      char * backup = CopyString(contents);
      int len = strlen(backup);
      char * string = new char[len + 1];
      // what char / font combination to use for desired blocking char on all platforms?
      // memset(string, 'g', len);
      memset(string, 'l', len);
      string[len] = 0;
      GetSelPos(&l, &y, &x1, &l, &y, &x2, false);
      contents = string;
      SetSelPos(l, y, x1, l, y, x2);
      EditBox::OnRedraw(surface);
      memcpy(contents, backup, len);
      delete string;
      delete backup;
   }

   bool OnCreate(void)
   {
    
        about.Destroy(0);
        enckey.Destroy(0);
        sounds.Destroy(0);
        changename.Destroy(0);
        portssetup.Destroy(0);  
        info.Destroy(0);

      return true;
   }               

}

 PasswordBox passwordbox {mainpanel, autoCreate = false; };