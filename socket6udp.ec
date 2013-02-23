import "ecere"
import "mainpanel"


define samplePort6 = (atoi(portssetup.editBox10.contents));

struct SamplePacket6
{
   int stringLen;
   char string[1];   
};

class MySocket6 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   { 
      if(count >= sizeof(SamplePacket6))
      {
         SamplePacket6 * packet = (SamplePacket6 *) buffer;
         uint size = sizeof(SamplePacket6) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket6 socket6 {};