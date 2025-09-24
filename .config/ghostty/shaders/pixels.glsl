#define gridsize 3.
#define linewidth 1.
#define contrast .3

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
  vec2 uv = fragCoord/iResolution.xy;
  float sx = step(mod(fragCoord.x, gridsize), linewidth);
  float sy = step(mod(fragCoord.y, gridsize), linewidth);
  float s = clamp(sx+sy, 0., contrast);
  vec4 col = texture(iChannel0, uv);
  col = col*(1. + contrast) - s;
  fragColor = vec4(col);
}
