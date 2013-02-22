import "ecere"
import "mainpanel"


define samplePort5 = (atoi(portssetup.editBox9.contents));

struct SamplePacket5
{
   int stringLen;
   char string[1];   
};

class MySocket5 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture53.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket5))
      {
         SamplePacket5 * packet = (SamplePacket5 *) buffer;
         uint size = sizeof(SamplePacket5) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
/*      bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket5) + len;
         SamplePacket5 * packet = (SamplePacket5 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket5).Send(packet, size);

         delete packet;
         return true;
      }  */
}

MySocket5 socket5 {};