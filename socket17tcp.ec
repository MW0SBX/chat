import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort = (atoi(portssetup.editBox1.contents));

struct SamplePacket
{
   int nameLen;
   int msgLen;
   char data[1];   
};

class SampleService : Service
{
    void OnAccept()
    {
       if(!thissocket)
         thissocket = SampleSocket { this };
    }
}

class TCPSocket : SampleSocket
{
   void OnConnect()
   {
      mainpanel.picture70.visible = true;
      if(!thissocket)
         thissocket = this;
      else
         Disconnect(0); // Should not come here, someone is already connected to us so we should not try to connect
   }
}

class SampleSocket : Socket
{
   void SendMessage(String name, String msg)
   {
      int nameLen = strlen(name);
      int msgLen = strlen(msg);
      int size = sizeof(SamplePacket) + nameLen + msgLen + 1;
      SamplePacket * packet = (SamplePacket *)new byte[size];
      packet->nameLen = nameLen;
      packet->msgLen = msgLen;
      memcpy(packet->data, name, nameLen+1);
      memcpy(packet->data + nameLen+1, msg, msgLen+1);
      Send(packet, size);
      delete packet;
   }

   void OnDisconnect(int code)
   {
      if(thissocket == this)
         thissocket = null;
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket))
      {
         SamplePacket * packet = (SamplePacket *) buffer;
         uint size = sizeof(SamplePacket) + packet->nameLen + packet->msgLen + 1;
         if(count >= size)
         {
            String name = packet->data;
            String msg = packet->data + packet->nameLen+1;
            mainpanel.AddMessage(name, msg);

            if(this == udpHostSocket)
               // Send back to the one sending us message...
               udpSendSocket.DatagramConnect(inetAddress, samplePort);
            return size;
         }
      }
      return 0;
   }
}

SampleService service { port = samplePort };
SampleSocket thissocket;
TCPSocket connectSocket { };
SampleSocket udpHostSocket { };
SampleSocket udpSendSocket { };
