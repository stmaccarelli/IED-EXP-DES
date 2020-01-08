
// importo la libreria di analisi dell'audio
import ddf.minim.*;
import ddf.minim.analysis.*;


// dichiaro di usare l'oggetto Minim, che contiene tutta la libreria
Minim minim;
// dichiaro il "libro" "in", come istanza di oggetto AudioInput.
// Audioinput è l'oggetto che gestisce l'audio in entrata nel computer (da scheda audio, microfoni, webcams, ecc)
AudioInput in;

FFT fftLin;



void setup(){
  size( 500, 500 );

  // inizializzo (avvio con eventuali parametri iniziali) gli oggetti minim e in;
  minim = new Minim(this);
  in = minim.getLineIn();
  
  fftLin = new FFT( in.bufferSize(), in.sampleRate() );
  
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages( 30 );

}

// dichiaro una variabile s, di tipo float (numeri decimali)
float s;

void draw(){
    fftLin.forward( in.mix );

  background(0);
  fill(255);
  noStroke();
  
  // s = livello di volume del mix (left + right) dell'oggetto in (AudioInput)
  s = in.mix.level() * 300;
  
  // disegno una ellisse ed uso s come SIZE dell'ellisse;
  ellipse( width/2, height/2, 50 + s, 50 + s);
    

}
