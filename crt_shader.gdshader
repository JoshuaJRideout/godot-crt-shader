shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float time_speed : hint_range(0.1, 5.0) = 1.0;
uniform float scanline_speed : hint_range(-2.0, 2.0) = 0.02;
uniform float scanline_intensity : hint_range(0.0, 1.0) = 0.15;
uniform float scanline_count : hint_range(200.0, 800.0) = 450.0;
uniform float noise_amount : hint_range(0.0, 0.3) = 0.08;
uniform float distortion_strength : hint_range(0.0, 0.15) = 0.05;
uniform float chromatic_aberration : hint_range(0.0, 5.0) = 1.5;
uniform float brightness : hint_range(0.5, 1.5) = 1.1;
uniform float contrast : hint_range(0.5, 2.0) = 1.2;
uniform float saturation : hint_range(0.0, 2.0) = 1.1;

// Random noise function
float random(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

// CRT screen curvature
vec2 curve_screen(vec2 uv) {
    uv = uv * 2.0 - 1.0;
    vec2 offset = abs(uv.yx) / vec2(6.0, 4.0);
    uv = uv + uv * offset * offset;
    uv = uv * 0.5 + 0.5;
    return uv;
}

void fragment() {
    vec2 curved_uv = curve_screen(UV);
    
    // Check if we're outside the curved screen bounds
    bool out_of_bounds = curved_uv.x < 0.0 || curved_uv.x > 1.0 || curved_uv.y < 0.0 || curved_uv.y > 1.0;
    
    vec3 color = vec3(0.0);
    
    if (!out_of_bounds) {
        // Add slight distortion ripple
        float distortion = sin(curved_uv.y * 50.0 + TIME * time_speed) * distortion_strength * 0.001;
        curved_uv.x += distortion;
        
        // Chromatic aberration
        float r = texture(screen_texture, curved_uv + vec2(chromatic_aberration * 0.001, 0.0)).r;
        float g = texture(screen_texture, curved_uv).g;
        float b = texture(screen_texture, curved_uv - vec2(chromatic_aberration * 0.001, 0.0)).b;
        
        color = vec3(r, g, b);
        
        // Moving scanlines
        float scanline_pos = curved_uv.y * scanline_count + TIME * scanline_speed * 100.0;
        float scanlines = sin(scanline_pos * 3.14159) * scanline_intensity;
        scanlines = clamp(scanlines, -1.0, 1.0);
        
        // Apply scanlines
        color *= (1.0 + scanlines * 0.3);
        
        // Random noise that changes over time
        float noise = random(curved_uv + fract(TIME * time_speed * 0.1)) * noise_amount;
        color += noise;
        
        // Brightness and contrast
        color = ((color - 0.5) * contrast + 0.5) * brightness;
        
        // Saturation
        float gray = dot(color, vec3(0.299, 0.587, 0.114));
        color = mix(vec3(gray), color, saturation);
        
        // Subtle vignette
        vec2 center = curved_uv - 0.5;
        float vignette = 1.0 - dot(center, center) * 0.5;
        color *= vignette;
    }
    
    COLOR = vec4(color, 1.0);
}
