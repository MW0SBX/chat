import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort10 = (atoi(portssetup.editBox14.contents));

struct SamplePacket10
{
   int stringLen;
   char string[1];   
};

class MySocket10 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture58.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket10))
      {
         SamplePacket10 * packet = (SamplePacket10 *) buffer;
         uint size = sizeof(SamplePacket10) + packet->stringLen;

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
         int size = sizeof(SamplePacket10) + len;
         SamplePacket10 * packet = (SamplePacket10 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket10).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket10 socket10 {};