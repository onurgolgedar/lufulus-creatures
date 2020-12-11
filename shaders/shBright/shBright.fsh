varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float uni_alpha;

void main() {
    vec4 OriginalColor =  texture2D(gm_BaseTexture, v_vTexcoord);
    
    float Red = OriginalColor.r;
    float Green = OriginalColor.g;
    float Blue = OriginalColor.b;
    float Alpha = OriginalColor.a*uni_alpha;
	
	float brightValue = 1.15+(Red+Green+Blue)*(Red+Green+Blue)/14.0;

    vec4 Color = vec4(Red*brightValue, Green*brightValue, Blue*brightValue, Alpha);
    gl_FragColor = Color;
}