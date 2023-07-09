import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myBroadcastLocation;
float delta_lf;
float delta_rf;
float delta_avr;
float delta_lt;
float delta_rt;
float theta_lf;
float theta_rf;
float theta_avr;
float theta_lt;
float theta_rt;
float alpha_lf;
float alpha_rf;
float alpha_avr;
float alpha_lt;
float alpha_rt;
float beta_lf;
float beta_rf;
float beta_avr;
float beta_lt;
float beta_rt;
float gamma_lf;
float gamma_rf;
float gamma_avr;
float gamma_lt;
float gamma_rt;
Mover[] movers = new Mover[1];
float relativeB;

void setup() {
  size(300, 800);
  oscP5 = new OscP5(this, 5000);
  myBroadcastLocation = new NetAddress("192.168.1.6", 5000);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(5, width/2, height);
  }
}

void draw() {
  background(255);
  relativeB = map((pow(beta_avr, 10)/(pow(theta_avr, 10) + pow(alpha_avr, 10) + pow(delta_avr, 10) + pow(gamma_avr, 10))), -2, 2, 0, 1);
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0, map(relativeB, 0, 1, 0.001, -1));
    PVector gravity = new PVector(0, 0.5);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
void oscEvent(OscMessage theOscMessage) {
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
  if (theOscMessage.checkAddrPattern("/muse/elements/delta_absolute")==true) {
    delta_lt = theOscMessage.get(0).floatValue();
    delta_lf = theOscMessage.get(1).floatValue();
    delta_rf = theOscMessage.get(2).floatValue();
    delta_rt = theOscMessage.get(3).floatValue();
    delta_avr = (delta_lt+delta_lf+delta_rf+delta_rt)/4;
  } 
  if (theOscMessage.checkAddrPattern("/muse/elements/theta_absolute")==true) {
    theta_lt = theOscMessage.get(0).floatValue();
    theta_lf = theOscMessage.get(1).floatValue();
    theta_rf = theOscMessage.get(2).floatValue();
    theta_rt = theOscMessage.get(3).floatValue();
    theta_avr = (theta_lt+theta_lf+theta_rf+theta_rt)/4;
  }
  if (theOscMessage.checkAddrPattern("/muse/elements/alpha_absolute")==true) {
    alpha_lt = theOscMessage.get(0).floatValue();
    alpha_lf = theOscMessage.get(1).floatValue();
    alpha_rf = theOscMessage.get(2).floatValue();
    alpha_rt = theOscMessage.get(3).floatValue();
    alpha_avr = (alpha_lt+alpha_lf+alpha_rf+alpha_rt)/4;
  }
  if (theOscMessage.checkAddrPattern("/muse/elements/beta_absolute")==true) {
    beta_lt = theOscMessage.get(0).floatValue();
    beta_lf = theOscMessage.get(1).floatValue();
    beta_rf = theOscMessage.get(2).floatValue();
    beta_rt = theOscMessage.get(3).floatValue();
    beta_avr = (beta_lt+beta_lf+beta_rf+beta_rt)/4;
  }
  if (theOscMessage.checkAddrPattern("/muse/elements/gamma_absolute")==true) {
    gamma_lt = theOscMessage.get(0).floatValue();
    gamma_lf = theOscMessage.get(1).floatValue();
    gamma_rf = theOscMessage.get(2).floatValue();
    gamma_rt = theOscMessage.get(3).floatValue();
    gamma_avr = (gamma_lt+gamma_lf+gamma_rf+gamma_rt)/4;
  }
}
