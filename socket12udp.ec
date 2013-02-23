import "ecere"
import "mainpanel"


define samplePort12 = (atoi(portssetup.editBox16.contents));

struct SamplePacket12
{
   int stringLen;
   char string[1];   
};

class MySocket12 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   { 
      if(count >= sizeof(SamplePacket12))
      {
         SamplePacket12 * packet = (SamplePacket12 *) buffer;
         uint size = sizeof(SamplePacket12) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket12 socket12 {};