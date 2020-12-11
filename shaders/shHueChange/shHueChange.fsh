varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float uni_alpha;
uniform float uni_active;

void main() {
    vec4 OriginalColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
	float Red = OriginalColor.r;
	float Green = OriginalColor.g;
	float Blue = OriginalColor.b;
	float Alpha = OriginalColor.a*uni_alpha;
	
	if (uni_active == 1.0) {
	    Red = OriginalColor.b;
	    Green = OriginalColor.r;
	    Blue = OriginalColor.g;
	} else if (uni_active == 2.0) {
	    Red = OriginalColor.g;
	    Green = OriginalColor.b;
	    Blue = OriginalColor.r;
	} else if (uni_active == 3.0) {
	    Red = OriginalColor.g;
	    Green = OriginalColor.r;
	    Blue = OriginalColor.b;
	} else if (uni_active == 4.0) {
		const vec3 ww = vec3(0.2125, 0.7154, 0.0721);
		float luminance = dot(OriginalColor.rgb, ww);
		
		Red = luminance;
		Green = luminance;
		Blue = luminance;
	}
    
    vec4 Color = vec4(Red, Green, Blue, Alpha);
    gl_FragColor = Color;
}