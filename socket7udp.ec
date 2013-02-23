import "ecere"
import "mainpanel"


define samplePort7 = (atoi(portssetup.editBox11.contents));

struct SamplePacket7
{
   int stringLen;
   char string[1];   
};

class MySocket7 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket7))
      {
         SamplePacket7 * packet = (SamplePacket7 *) buffer;
         uint size = sizeof(SamplePacket7) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
 
}

MySocket7 socket7 {};