import processing.serial.*;
import cc.arduino.*;
import eeml.*;
import pachuino.*;

Pachuino p;

void setup(){   
    p = new Pachuino(this, Arduino.list()[0], 57600);   
    p.manualUpdate("http://www.pachube.com/api/37420.xml"); // change URL -- this is the feed you want to update
    p.setKey("4Xt4EbyHzKpoNj1w1fxsTEelWDPbBD6sGdVG2Tjj0iY");   

   
    // local sensors   
    p.addLocalSensor("digital", 7,"ultrasonicSensor");

}

void draw(){
  float tempVal1 = p.localSensor[0].value;
  println(tempVal1);
 
    //p.debug();
}



// you don't need to change any of these

void onReceiveEEML(DataIn d){ 
    p.updateRemoteSensors(d);
}
