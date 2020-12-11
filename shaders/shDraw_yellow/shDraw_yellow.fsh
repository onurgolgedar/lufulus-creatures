varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float uni_alpha;

void main() {
    vec4 OriginalColor =  texture2D(gm_BaseTexture, v_vTexcoord);
    
    float Red = 255.0;
    float Green = 255.0;
    float Blue = 0.0;
    float Alpha = OriginalColor.a*uni_alpha;
    
    vec4 Color = vec4(Red, Green, Blue, Alpha);
    gl_FragColor = Color;
}