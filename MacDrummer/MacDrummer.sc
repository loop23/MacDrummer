// Check if client is sending here:
NetAddr.langPort;
// Probably useless
s.latency = 0.01;
// A super stupid synth
(
    SynthDef( "md1", { arg freq=400.0;
        var env, amp, decay;
        decay = (-0.004 * freq) + 6;
        env = Env.perc(0.01, decay);
        amp = EnvGen.kr(env, 1, doneAction:2);
        Out.ar([0,1], SinOsc.ar( freq ) * amp * 0.2);
    }).send(s);
)
// The thing that listens for OSC messages
(
o = OSCFunc({ arg msg, time, addr, recvPort; 
	var pitch = 40 + (msg[1] * 2000);
	[msg, pitch].postln;
	Synth("md1", [\freq, pitch]);
	 }, '/MacDrummer/DrumHit/1'); // creat
)

// Doesn't work! shall check docs again!
o.remove
