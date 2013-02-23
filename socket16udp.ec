import "ecere"
import "mainpanel"


define samplePort16 = (atoi(portssetup.editBox20.contents));

struct SamplePacket16
{
   int stringLen;
   char string[1];   
};

class MySocket16 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket16))
      {
         SamplePacket16 * packet = (SamplePacket16 *) buffer;
         uint size = sizeof(SamplePacket16) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket16 socket16 {};