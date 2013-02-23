import "ecere"
import "mainpanel"


define samplePort4 = (atoi(portssetup.editBox8.contents));

struct SamplePacket4
{
   int stringLen;
   char string[1];   
};

class MySocket4 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket4))
      {
         SamplePacket4 * packet = (SamplePacket4 *) buffer;
         uint size = sizeof(SamplePacket4) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket4 socket4 {};