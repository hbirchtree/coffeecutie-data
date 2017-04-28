#version 100

precision lowp float;

varying vec2 vs_tc;

uniform float mx;

uniform mediump sampler2D texdata;

void main(void)
{
    vec4 smp = texture2D(texdata, vs_tc);
    if(smp.a < 0.5)
        discard;
    gl_FragColor = smp;
}
