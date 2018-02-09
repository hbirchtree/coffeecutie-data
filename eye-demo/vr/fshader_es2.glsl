#version 100

precision lowp float;

varying vec2 vs_tc;

uniform float mx;

uniform mediump sampler2D texdata;
uniform float texdata_gridSize;

out vec4 OutColor;

void main(void)
{
    /*Common alpha mask*/
    vec4 a1_mask = texture2DArray(texdata,vec3(vs_tc,2));

    /* Colors to blend */
    vec4 c1,c2,c3;

    if(InstanceID < 2)
    {
        c1 = texture2DArray(texdata,vec3(vs_tc,0)); /* Normal color */
        c2 = texture2DArray(texdata,vec3(vs_tc,1)); /* Weird color */
    }else{
        c1 = c2 = texture2DArray(texdata,vec3(vs_tc,3));
    }

    if(c1.a==0.)
        discard;

    float a1 = a1_mask.a;
    if(mx<a1)
        gl_FragColor = c1;
    else
        gl_FragColor = c2;

//    vec4 smp = texture2DArray(texdata, vec3(vs_tc, 0));
//    gl_FragColor = smp;
}
