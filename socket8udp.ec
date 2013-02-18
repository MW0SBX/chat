import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort8 = (atoi(portssetup.editBox12.contents));

struct SamplePacket8
{
   int stringLen;
   char string[1];   
};

class MySocket8 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture56.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket8))
      {
         SamplePacket8 * packet = (SamplePacket8 *) buffer;
         uint size = sizeof(SamplePacket8) + packet->stringLen;

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
         int size = sizeof(SamplePacket8) + len;
         SamplePacket8 * packet = (SamplePacket8 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket8).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket8 socket8 {};