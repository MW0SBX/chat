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


<<<<<<< HEAD
=======
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
      /*bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket12) + len;
         SamplePacket12 * packet = (SamplePacket12 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket12).Send(packet, size);

         delete packet;
         return true;
      }  */
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket12 socket12 {};