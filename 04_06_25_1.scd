//prender sp
s.boot;


//medidor
s.meter;
s.scope;


//ruido blanco
{WhiteNoise.ar(0.2)!2}.play


//sintetizador o instrumento
(
SynthDef(\tri, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen= LFTri.ar(freq, 0, amp);
	paneo= Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0, 1, 0], [at, rel]), doneAction: 2);
	Out.ar(out, paneo * env)
}).add
);

a=Synth(\tri, [\rel,0.2,\freq,rrand(200,800)]);



//Patrón de secuencia
(
~gato=Pdef(\alba, Pbind(
	\instrument, \tri,
	\dur, Pseq([0.5,0.25,0.25], inf),
	\amp, 0.5,
	\note, Pseq([0,2,4,5,7,12,5,4,2,9,0,2], inf)
)).play
);

//~sec.play.quant_(4);
//~sec.stop;