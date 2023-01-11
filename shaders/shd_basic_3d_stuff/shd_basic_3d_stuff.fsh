#extension GL_OES_standard_derivatives : enable

varying vec2 v_vTexcoord;
varying vec4 v_vBarycentric;

varying vec3 v_worldPosition;

varying float v_DistanceFromCamera;

uniform vec3 lightDirection;

void main() {
    float wire_thickness = 1.5;
    float wire_alpha = 0.5;
    vec3 wire_color = vec3(1, 0, 0);
    float wire_fadeout_distance = 1000.0;
    
    wire_alpha /= v_DistanceFromCamera / wire_fadeout_distance;
    wire_alpha = clamp(wire_alpha, 0.0, 1.0);
    
    vec3 bc_width = fwidth(v_vBarycentric.rgb);
    vec3 aa_width = smoothstep(vec3(0), bc_width * wire_thickness, v_vBarycentric.rgb);
    float edge_factor = min(aa_width.r, min(aa_width.g, aa_width.b));
    
    edge_factor = 1.0 - edge_factor;
    
    gl_FragColor.rgb = mix(texture2D(gm_BaseTexture, v_vTexcoord).rgb, wire_color, edge_factor * wire_alpha);
    gl_FragColor.a = 1.0;
    
    
    
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