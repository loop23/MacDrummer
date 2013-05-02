# MacDrummer

Is a playground to investigate novel uses of the trackpad as an
expressive musical instrument. The idea is to have it behave like a
djembe or darbouka, but maybe even hang, so that touches in different
positions, or the speed at which fingers release the pad after a hit
change the sound, or by using certain parts of the trackpad as sound
modifiers. The first version is going to use OSC to have sound generated
by something else like PD or Max/msp, since the AudioUnits API seemed
a bit intimidating.

## Notes

This is my first osx app and it probably shows;
It just about started generating OSC messages, namely /MacDrummer/DrumHit/1 with
a float parameter ranging from 0 to about 0.7

I'm beginning work on the SuperCollider part.

## Licence

I still have to decide, probably MIT or GPL; At the moment it's so
dumb that it can safely be assumed to be in the public domain.

## Thanks

I'm using http://code.google.com/p/vvopensource/ to handle OSC.

Thank you!
