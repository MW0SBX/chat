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

class SocketSample : Window
{
   text = "Socket Sample";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = { 416, 176 };
   nativeDecorations = true;

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

SocketSample mysocket { autoCreate = false; };
SampleService service { port = samplePort };
SampleSocket connectedSocket, servingSocket;
