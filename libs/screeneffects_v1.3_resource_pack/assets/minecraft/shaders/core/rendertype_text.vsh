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

vec3 newPosition = Position;

void main() {
    float id = floor((newPosition.y + 1000.0) / 2000.0);
    newPosition.y = mod(newPosition.y + 1000.0, 2000.0) - 1000.0;

    gl_Position = ProjMat * ModelViewMat * vec4(newPosition, 1.0);

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;

    if (id >= 4.0 && id <= 5.0) {
        float aspect = ScreenSize.x / ScreenSize.y;
        vec2 corner = corners[gl_VertexID % 4];
        vec2 scaled = (corner * 2.0 - 1.0) * vec2(1.0, aspect);

        gl_Position = vec4(scaled, 0.0, 1.0);
    }
}