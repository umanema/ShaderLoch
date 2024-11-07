#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 p = (2.0*fragCoord-iResolution.xy)/iResolution.y;
    float noiseX = simplex2D(vec2(0., iTime * 0.1)) * 2.;
    float noiseY = simplex2D(vec2(iTime * 0.2, 0.));
    float d = sdCircle(p + vec2(noiseX, noiseY),sin(iTime)*0.2 + 0.3);
    d = 1.-smoothstep(0.,0.1, d);
    fragColor = vec4(d, d, d,1.0);
}