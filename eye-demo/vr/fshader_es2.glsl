#version 100

precision lowp float;

varying vec2 vs_tc;

uniform float mx;

uniform mediump sampler2D texdata;

void main(void)
{
    vec4 smp = texture2D(texdata, vs_tc);
    gl_FragColor = smp;
//    gl_FragColor = vec4(vec3(vs_tc, 0.), 1.);
}
