import "ecere"
import "mainpanel"


define samplePort14 = (atoi(portssetup.editBox18.contents));

struct SamplePacket14
{
   int stringLen;
   char string[1];   
};

class MySocket14 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture62.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket14))
      {
         SamplePacket14 * packet = (SamplePacket14 *) buffer;
         uint size = sizeof(SamplePacket14) + packet->stringLen;

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
         int size = sizeof(SamplePacket14) + len;
         SamplePacket14 * packet = (SamplePacket14 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket14).Send(packet, size);

         delete packet;
         return true;
      }  */
}

MySocket14 socket14 {};