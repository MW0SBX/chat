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

<<<<<<< HEAD
 
=======
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
      /*bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket16) + len;
         SamplePacket16 * packet = (SamplePacket16 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket16).Send(packet, size);

         delete packet;
         return true;
      }  */
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket16 socket16 {};