import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort = 40001;

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
      }
   }
}

class SampleSocket : Socket
{
   void OnConnect()
   {

   }

   void OnDisconnect(int code)
   {
      if(connectedSocket == this)
         connectedSocket = null;
      else if(servingSocket == this)
         servingSocket = null;      
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket))
      {
         SamplePacket * packet = (SamplePacket *) buffer;
         uint size = sizeof(SamplePacket) + packet->stringLen;
         if(count >= size)
         {
            portssetup.recvString.contents = packet->string;

            return size;
         }
      }

      return 0;
   }
}

class Mysocket17 : Window
{
   caption = "Mysocket1";
   background = black;
   foreground = white;
   borderStyle = fixed;
   hasClose = true;
   size = { 416, 176 };
   nativeDecorations = false;

   bool listening;

      bool () 
      {
         connectedSocket = SampleSocket { };
         connectedSocket.Connect(portssetup.serverAddress.contents, samplePort);
         return true;
      }


   void OnDestroy()
   {
      if(connectedSocket)
         connectedSocket.Disconnect(0);
      service.Stop();
   }
}

Mysocket17 mysocket {mainpanel, autoCreate = false };
SampleService service { port = samplePort  };
SampleSocket connectedSocket, servingSocket;
