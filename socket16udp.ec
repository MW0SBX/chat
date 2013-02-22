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
   void OnConnect() 
   {
       mainpanel.picture64.visible = true; 
   }

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
}

MySocket16 socket16 {};