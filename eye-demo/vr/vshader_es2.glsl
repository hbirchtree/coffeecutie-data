#version 100

precision mediump float;

layout(location=0) in vec3 pos;
layout(location=1) in vec2 tex;

varying vec2 vs_tc;

uniform int InstanceID;
uniform int InstanceCount;

uniform mat4 transform[6];
uniform vec2 tex_mul[2];

void main(void)
{
    /* Regular vertex properties */
    vs_tc = tex;
    gl_Position = transform[InstanceID]*vec4(pos,1.);
}
