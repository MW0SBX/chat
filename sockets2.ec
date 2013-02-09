import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort2 = 40002;

struct SamplePacket2
{
   int stringLen;
   char string[1];   
};

class SampleService2 : Service
{
   void OnAccept()
   {
      if(!servingSocket2)
      {
         servingSocket2 = SampleSocket2 { this };
      }
   }
}

class SampleSocket2 : Socket
{
   void OnConnect()
   {

   }

   void OnDisconnect(int code)
   {
      if(connectedSocket2 == this)
         connectedSocket2 = null;
      else if(servingSocket2 == this)
         servingSocket2 = null;      
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

class Mysocket18 : Window
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
         connectedSocket2 = SampleSocket2 { };
         connectedSocket2.Connect(portssetup.serverAddress.contents, samplePort2);
         return true;
      }


   void OnDestroy()
   {
      if(connectedSocket2)
         connectedSocket2.Disconnect(0);
      service2.Stop();
   }
}

Mysocket18 mysocket2 {mainpanel, autoCreate = false };
SampleService2 service2 { port = samplePort2  };
SampleSocket2 connectedSocket2, servingSocket2; 