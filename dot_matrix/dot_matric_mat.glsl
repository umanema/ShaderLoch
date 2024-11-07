//credits: https://www.shadertoy.com/view/3ls3zM

#include "common.glsl"

#iChannel0 "file://dot_matrix_geo.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = (fragCoord / iResolution.xy) * 2.0 - 1.0;

    vec2 p = (2.0*fragCoord-iResolution.xy)/iResolution.y;
    float noise = simplex3d(vec3(p*4., iTime)) * 0.5 + 0.5;
    noise = simplex3d(vec3(noise*2., noise*2.,iTime)) * 0.5 + 0.4;
    float ny = 1.0 + 40.0;
    float nx = ny * iResolution.x / iResolution.y;
    vec2 num = vec2(nx, ny);
    
    vec3 col;
    vec2 uvDot = (((floor(uv * num) + 0.5) / num) + 1.0) * 0.5;
   	vec3 lum = texture(iChannel0, uvDot).rgb;
    
    vec2 uvGrid = fract(uv * num);
    vec2 pGrid = uvGrid - 0.5;
    col = (lum + 0.05) * 5.0 * saturate(-sdCircle(pGrid, 0.5 * noise));

    fragColor = vec4(col, 1.0);
}