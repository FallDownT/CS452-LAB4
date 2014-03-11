#version 130 

in   vec4 vPosition;
in   vec3 vNormal;

// output values that will be interpretated per-fragment
out  vec3 fN;
out  vec3 fE;
out  vec3 fL1;
out  vec3 fL2;

uniform mat4 ModelView;
uniform vec4 LightPosition1;
uniform vec4 LightPosition2;
uniform mat4 Projection;

void main()
{
    fN = vNormal;
    fE = (ModelView*vPosition).xyz;
    fL1 = LightPosition1.xyz;
    fL2 = LightPosition2.xyz;
    
    if( LightPosition1.w != 0.0 ) {
		fL1 = LightPosition1.xyz - vPosition.xyz;
    }
    
    if( LightPosition2.w != 0.0 ) {
		fL2 = LightPosition2.xyz - vPosition.xyz;
    }

    gl_Position = Projection*ModelView*vPosition;
}
