import "ecere"
import "mainpanel"


define samplePort8 = (atoi(portssetup.editBox12.contents));

struct SamplePacket8
{
   int stringLen;
   char string[1];   
};

class MySocket8 : Socket
{

<<<<<<< HEAD
 
=======
   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket8))
      {
         SamplePacket8 * packet = (SamplePacket8 *) buffer;
         uint size = sizeof(SamplePacket8) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
    /*  bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket8) + len;
         SamplePacket8 * packet = (SamplePacket8 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket8).Send(packet, size);

         delete packet;
         return true;
      }  */
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket8 socket8 {};