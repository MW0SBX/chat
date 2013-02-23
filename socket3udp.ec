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

<<<<<<< HEAD
 
=======
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
     /* bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket3) + len;
         SamplePacket3 * packet = (SamplePacket3 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket3).Send(packet, size);

         delete packet;
         return true;
      } */ 
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket3 socket3 {};