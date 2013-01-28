import "ecere"

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket { };

class UDP1 : GuiApplication
{
   bool Init()
   {
      socket.DatagramHost(15000);  //incomming
      socket.DatagramHost(15001);
      socket.DatagramHost(25002);
      socket.DatagramHost(25003);
      socket.DatagramHost(25004);
      socket.DatagramHost(35005);
      socket.DatagramHost(35006);
      socket.DatagramHost(35007);
      socket.DatagramHost(35008);
      
      socket.DatagramHost(45000);  //outgoing
      socket.DatagramHost(45001);
      socket.DatagramHost(45002);
      socket.DatagramHost(55003);
      socket.DatagramHost(55004);
      socket.DatagramHost(55005);
      socket.DatagramHost(65006);
      socket.DatagramHost(65007);
      socket.DatagramHost(65008);     
        
      return true;
   }
}

class Sckt1 : Window
{
   text = "";
   background = 0;
   borderStyle = fixed;
   hasMaximize = false;
   hasMinimize = false;
   hasClose = false;
   size = { 5, 5 };
   visible = false;
}
Sckt1 sckt1 {  }; 
