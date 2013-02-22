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
   void OnConnect() 
   {
       mainpanel.picture55.visible = true; 
   }

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
      /*bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket7) + len;
         SamplePacket7 * packet = (SamplePacket7 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket7).Send(packet, size);

         delete packet;
         return true;
      }  */
}

MySocket7 socket7 {};