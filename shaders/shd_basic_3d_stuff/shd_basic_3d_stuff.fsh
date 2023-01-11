#extension GL_OES_standard_derivatives : enable

varying vec2 v_vTexcoord;
varying vec4 v_vBarycentric;

varying vec3 v_worldPosition;

uniform vec3 lightDirection;

void main() {
    if (v_vBarycentric.r < 0.02 || v_vBarycentric.g < 0.02 || v_vBarycentric.b < 0.02) {
        gl_FragColor = vec4(0, 0, 0, 1);
    } else {
        gl_FragColor  = vec4(1, 1, 1, 1);
    }
    
    
    
    
    /*
    vec4 starting_color = v_vBarycentric * texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec4 lightAmbient = vec4(0.25, 0.25, 0.25, 1);
    vec3 lightDirection = normalize(lightDirection);
    
    vec3 dx = dFdx(v_worldPosition);
    vec3 dy = dFdy(v_worldPosition);
    vec3 world_normal = normalize(cross(dx, dy));
    
    float NdotL = max(0.0, -dot(world_normal, lightDirection));
    
    vec4 final_color = starting_color * vec4(min(lightAmbient + NdotL, vec4(1)).rgb, starting_color.a);
    gl_FragColor = final_color;
    */
}