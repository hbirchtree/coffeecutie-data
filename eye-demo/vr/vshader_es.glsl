#version 300 es
#extension GL_EXT_shader_io_blocks : enable

precision lowp float;

layout(location=0)in vec3 pos;
layout(location=1)in vec2 tex;

//#ifdef GL_EXT_shader_io_blocks
//out float gl_ClipDistance[1];
//#endif

out vec2 vs_tc;
flat out int vs_instance;

uniform mat4 transform[102];
uniform vec2 tex_mul[2];

void main(void)
{
    const vec2 tex_mul[2] = vec2[](vec2(1.,1.),vec2(-1.,1.));

    /* The current eye being rendered */
    int instance = gl_InstanceID;
    int eyeId = instance%2;

    /* Regular vertex properties */
    vs_instance = instance;
    vs_tc = tex*tex_mul[eyeId];
    gl_Position = transform[instance]*vec4(pos,1.);

//#ifdef GL_EXT_shader_io_blocks
//    /* Clip plane properties */
//    const vec4 eyeClipEdge[2] = vec4[](vec4(-1.,0.,0.,1.),vec4(1.,0.,0.,1.));
//    const float eyeOffsetScale[2] = float[](-.5,.5);

//    vec4 clipPlane = vec4(0.);
//    clipPlane.x = eyeOffsetScale[eyeId];

//    /* This lets us avoid having to fiddle with viewports or viewport arrays */
//    gl_ClipDistance[0] = dot(gl_Position,clipPlane);
//#endif
}
