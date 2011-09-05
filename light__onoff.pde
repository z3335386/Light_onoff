/*
 * A simple programme that will change the intensity of
 * an LED based  * on the amount of light incident on 
 * the photo resistor.
 * 
 */

//PhotoResistor Pin
int lightPin = 0; //the analog pin the photoresistor is 
                  //connected to
                  //the photoresistor is not calibrated to any units so
                  //this is simply a raw sensor value (relative light)
//LED Pin
int ledPin = 9;   //the pin the LED is connected to
                  //we are controlling brightness so 
                  //we use one of the PWM (pulse width
                  // modulation pins)
void setup()
{
  pinMode(ledPin, OUTPUT); //sets the led pin to output
}
 /*
 * loop() - this function will start after setup 
 * finishes and then repeat
 */


void loop(){
int threshold = 300;
if(analogRead(lightPin) > threshold){
digitalWrite(ledPin,HIGH);
}else{
digitalWrite(ledPin, LOW);
}}

