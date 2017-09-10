#version 100

precision mediump float;

attribute vec3 pos;
attribute vec2 tex;

varying vec2 vs_tc;

uniform int InstanceID;
uniform int InstanceCount;

uniform mat4 transform[6];
uniform vec2 tex_mul[2];

void main(void)
{
    /* Regular vertex properties */
    float squareSize = sqrt(float(InstanceCount));
    int iSquareSize = int(squareSize);
    float fSquareSize = 1.0 / squareSize;
    
    float gridY = float(InstanceID / iSquareSize) * fSquareSize;
    float gridX = (float(InstanceID) - gridY * squareSize) * fSquareSize;
    
    vec2 baseCoord = vec2(gridX * fSquareSize, gridY * fSquareSize);
    
//    vs_tc = (tex * fSquareSize);
    vs_tc = tex * vec2(0.5, 0.5)
            * vec2(fSquareSize, fSquareSize)
            + vec2(0.25)
            + vec2(gridX, gridY);

    gl_Position = transform[InstanceID]*vec4(pos,1.);
}
