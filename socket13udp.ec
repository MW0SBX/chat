import "ecere"
import "mainpanel"


define samplePort13 = (atoi(portssetup.editBox17.contents));

struct SamplePacket13
{
   int stringLen;
   char string[1];   
};

class MySocket13 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture61.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket13))
      {
         SamplePacket13 * packet = (SamplePacket13 *) buffer;
         uint size = sizeof(SamplePacket13) + packet->stringLen;

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
         int size = sizeof(SamplePacket13) + len;
         SamplePacket13 * packet = (SamplePacket13 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket13).Send(packet, size);

         delete packet;
         return true;
      }  */
}

MySocket13 socket13 {};