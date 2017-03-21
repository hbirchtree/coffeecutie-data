#version 100

precision lowp float;

attribute vec3 pos;
attribute vec2 tex;

varying vec2 vs_tc;

uniform mat4 transform[6];
uniform vec2 tex_mul[2];

void main(void)
{
    /* Regular vertex properties */
    vs_tc = tex;
    gl_Position = transform[0]*vec4(pos,1.);
}
