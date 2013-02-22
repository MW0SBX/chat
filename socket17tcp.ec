import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort = (atoi(portssetup.editBox1.contents));

struct SamplePacket
{
   int stringLen;
   char string[1];   
};

class SampleService : Service
{
   void OnAccept()
   {

      if(!servingSocket)
      {
         servingSocket = SampleSocket { this };
         sockettxrx.UpdateButtonStates();
      }
   }
}

class SampleSocket : Socket
{
   void OnConnect() //DatagramConnect() 
   {
      sockettxrx.UpdateButtonStates();
      mainpanel.picture70.visible = true;  
   }

   void OnDisconnect(int code)
   {

      if(connectedSocket == this)
         connectedSocket = null;
      else if(servingSocket == this)
         servingSocket = null;

      sockettxrx.UpdateButtonStates();      
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket))
      {
         SamplePacket * packet = (SamplePacket *) buffer;
         uint size = sizeof(SamplePacket) + packet->stringLen;

         if(count >= size)
         {

            //portssetup.recvString.contents = packet->string; //recvString in portssetup 
            chatFile.Puts (packet->string);
             
            return size;
         }
         
      }

      return 0;
   }
}


class SocketSample : Window
{
   caption = "Socket Sample";
   background = activeBorder;
   opacity = 0;
   tabCycle = true;
   size = { 416, 176 };
   visible = false;

   bool listening;

   void UpdateButtonStates()
   {
      bool connected = (connectedSocket && connectedSocket.connected) || (servingSocket && servingSocket.connected);

      btnSend.disabled = !connected;
      btnConnect.disabled = connectedSocket != null;
      btnListen.disabled = listening;
   }

   Button btnSend 
   {      
      this, text = "Send", position = { 344, 64 }, disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket) + len;
         SamplePacket * packet = (SamplePacket *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (connectedSocket ? connectedSocket : servingSocket).Send(packet, size);

         delete packet;
         return true;
      }
   };
   
   Button btnListen 
   {      
      this, text = "Listen", position = { 144, 104 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(service.Start())
         {
            listening = true;
            UpdateButtonStates();
         }
         return true;
      }
   };
   
   Button btnConnect 
   {      
      this, text = "Connect", position = { 8, 72 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         btnConnect.disabled = true;
         connectedSocket = SampleSocket { };
         connectedSocket.Connect(portssetup.serverAddress.contents, samplePort); //server address in portssetup

         return true;
      }
   };

   void OnDestroy()
   {
      if(connectedSocket)
         connectedSocket.Disconnect(0);
      service.Stop();
   }
}


SocketSample sockettxrx {mainpanel};
SampleService service { port = samplePort };
SampleSocket connectedSocket, servingSocket;
