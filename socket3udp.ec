import "ecere"
import "mainpanel"


define samplePort3 = (atoi(portssetup.editBox7.contents));

struct SamplePacket3
{
   int stringLen;
   char string[1];   
};

class MySocket3 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket3))
      {
         SamplePacket3 * packet = (SamplePacket3 *) buffer;
         uint size = sizeof(SamplePacket3) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket3 socket3 {};