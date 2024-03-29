attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vBarycentric;

varying vec3 v_worldPosition;

varying float v_DistanceFromCamera;

void main() {
    vec4 object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_worldPosition = (gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.)).xyz;
    
    v_DistanceFromCamera = (gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Position, 1.)).z;
    
    v_vBarycentric = in_Colour;
    v_vTexcoord = in_TextureCoord;
}