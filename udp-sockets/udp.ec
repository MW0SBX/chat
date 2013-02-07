import "ecere"
import "mainpanel"

class MySocket : Socket
{
   void OnConnect()
   {
 
   }
   
}

MySocket socket1 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket2 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket3 { }; 

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket4 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket5 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
} 

MySocket socket6 { }; 

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket7 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket8 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket9 { }; 

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket10 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket11 { };


class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket12 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket13 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket14 { }; 

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket15 { };

class MySocket : Socket
{
   void OnConnect()
   {
 //     printf("Connected!\n");
   }
   
}

MySocket socket16 { };            

class UDP1 : GuiApplication
{
   bool Init()
   {
      socket1.DatagramHost(50001);  //incomming
      socket2.DatagramHost(50002);
      socket3.DatagramHost(50003);
      socket4.DatagramHost(50004);
      socket5.DatagramHost(50005);
      socket6.DatagramHost(50006);
      socket7.DatagramHost(50007);
      socket8.DatagramHost(50008);
     
      socket9.DatagramHost(60001);   //outgoing 
      socket10.DatagramHost(60002);  
      socket11.DatagramHost(60003);
      socket12.DatagramHost(60004);
      socket13.DatagramHost(60005);
      socket14.DatagramHost(60006);
      socket15.DatagramHost(60007);
      socket16.DatagramHost(65008);
        
      return true;
   }
}

class Sckt1 : Window
{
   caption = "";
   background = black;
   borderStyle = fixed;
   size = { 66, 29 };
   visible = false;

  
}
Sckt1 sckt1 {  }; 




