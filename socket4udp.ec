import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort4 = (atoi(portssetup.editBox8.contents));

struct SamplePacket4
{
   int stringLen;
   char string[1];   
};

class MySocket4 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture52.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket4))
      {
         SamplePacket4 * packet = (SamplePacket4 *) buffer;
         uint size = sizeof(SamplePacket4) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
      bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket4) + len;
         SamplePacket4 * packet = (SamplePacket4 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket4).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket4 socket4 {};