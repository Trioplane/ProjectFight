#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:globals.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

vec2[] corners = vec2[](
  vec2(0.0, 1.0),
  vec2(0.0, 0.0),
  vec2(1.0, 0.0),
  vec2(1.0, 1.0)
);

vec3 pos = Position;
float ASCENT_OFFSET = 2000;
float HALF_ASCENT_OFFSET = ASCENT_OFFSET / 2;

void main() {
    float id = -floor((pos.y + HALF_ASCENT_OFFSET) / ASCENT_OFFSET);
    pos.y = mod(pos.y + HALF_ASCENT_OFFSET, ASCENT_OFFSET) - HALF_ASCENT_OFFSET;

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;

    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

    if (id == -2) {
        pos.y += 65; // push the actionbar down to revert offset
        gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);

        gl_Position.x += gl_Position.w;
        gl_Position.y += 2 * gl_Position.w;
        gl_Position.x -= 0.4;
    } else if (id <= -4.0 && id >= -5.0) { // ScreenEffects support
        float aspect = ScreenSize.x / ScreenSize.y;
        vec2 corner = corners[gl_VertexID % 4];
        vec2 scaled = (corner * 2.0 - 1.0) * vec2(1.0, aspect);

        gl_Position = vec4(scaled, 0.0, 1.0);
    }
}