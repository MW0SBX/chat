import "ecere"
import "mainpanel"


define samplePort8 = (atoi(portssetup.editBox12.contents));

struct SamplePacket8
{
   int stringLen;
   char string[1];   
};

class MySocket8 : Socket
{

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
 
}

MySocket8 socket8 {};