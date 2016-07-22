#version 300 es
#extension GL_EXT_shader_io_blocks : enable

#undef GL_EXT_shader_io_blocks

precision lowp float;

layout(location=0)in vec3 pos;
layout(location=1)in vec2 tex;

out gl_PerVertex{
    vec4 gl_Position;
#ifdef GL_EXT_shader_io_blocks
    float gl_ClipDistance[1];
#endif
};
out VS_OUT{
    vec2 tc;
    flat int instance;
} vs_out;

uniform mat4 transform[102];
uniform vec2 tex_mul[2];

void main(void)
{
    const vec2 tex_mul[2] = vec2[](vec2(1.,1.),vec2(-1.,1.));

    /* The current eye being rendered */
    int instance = gl_InstanceID;
    int eyeId = instance%2;

    /* Regular vertex properties */
    vs_out.instance = instance;
    vs_out.tc = tex*tex_mul[eyeId];
    gl_Position = transform[instance]*vec4(pos,1.);

#ifdef GL_EXT_shader_io_blocks
    /* Clip plane properties */
    const vec4 eyeClipEdge[2] = vec4[](vec4(-1.,0.,0.,1.),vec4(1.,0.,0.,1.));
    const float eyeOffsetScale[2] = float[](-.5,.5);

    vec4 clipPlane = vec4(0.);
    clipPlane.x = eyeOffsetScale[eyeId];

    /* This lets us avoid having to fiddle with viewports or viewport arrays */
    gl_ClipDistance[0] = dot(gl_Position,clipPlane);
#endif
}
