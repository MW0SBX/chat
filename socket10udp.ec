import "ecere"
import "mainpanel"


define samplePort10 = (atoi(portssetup.editBox14.contents));

struct SamplePacket10
{
   int stringLen;
   char string[1];   
};

class MySocket10 : Socket
{

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

}

MySocket10 socket10 {};