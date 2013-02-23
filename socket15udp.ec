import "ecere"
import "mainpanel"


define samplePort15 = (atoi(portssetup.editBox19.contents));

struct SamplePacket15
{
   int stringLen;
   char string[1];   
};

class MySocket15 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket15))
      {
         SamplePacket15 * packet = (SamplePacket15 *) buffer;
         uint size = sizeof(SamplePacket15) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
 
}

MySocket15 socket15 {};