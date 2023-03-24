int fsrPin = 1
//the FSR and 10K pulldown are connected to a0
int fsrReading
const int motorpin = 7 const int flexPin = A0 void setup() {
    // put your setup code here, to run once: Serial.begin(9600)
    pinMode(7, OUTPUT)
}
void loop() {
    // put your main code here, to run repeatedly:
    int flexValue
        flexValue = analogRead(flexPin) fsrReading = analogRead(fsrPin)
        if (flexValue > 890 & &fsrReading > 200) {
            Serial.println("U") digitalWrite(motorpin, HIGH) delay(1000)
        }
        else if (flexValue < 890 & &flexValue > 810 & &fsrReading > 200) {
            Serial.println("J")
                digitalWrite(motorpin, HIGH) delay(1000)
        }
        else
            digitalWrite(motorpin, LOW)
else if (flexValue < 810 fsrReading > 200) {
Serial.println("N") digitalWrite(motorpin, HIGH)
delay(1000)
}
else
digitalWrite(motorpin, LOW)
delay(1000)
}