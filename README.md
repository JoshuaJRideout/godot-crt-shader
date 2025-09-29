# Godot CRT Shader

An authentic CRT monitor shader for Godot 4.x that simulates the look of classic cathode ray tube displays.

## Features

- **Moving Scanlines** - Animated horizontal lines that scroll across the screen
- **Screen Curvature** - Realistic barrel distortion of CRT screens
- **Chromatic Aberration** - Color fringing at edges like real CRTs
- **Dynamic TV Noise** - Randomly changing static/grain
- **Color Enhancement** - Adjustable brightness, contrast, and saturation
- **Vignetting** - Subtle darkening at screen edges
- **Distortion Effects** - Subtle screen ripple

## Installation

1. Copy `crt_shader.gdshader` to your Godot project
2. Apply it to a ColorRect or CanvasLayer that covers your scene
3. Set the shader material on the node

## Usage

Add a ColorRect or CanvasLayer to cover your entire viewport:

```gdscript
# Create a full-screen overlay
var crt_overlay = ColorRect.new()
crt_overlay.set_anchors_preset(Control.PRESET_FULL_RECT)

# Load and apply the shader
var shader_material = ShaderMaterial.new()
shader_material.shader = load("res://crt_shader.gdshader")
crt_overlay.material = shader_material
```

## Parameters

All parameters can be adjusted in the inspector:

- **time_speed** (0.1-5.0): Controls animation speed - default: 1.0
- **scanline_speed** (-2.0-2.0): How fast scanlines move - default: 0.02
- **scanline_intensity** (0.0-1.0): Visibility of scanlines - default: 0.15
- **scanline_count** (200-800): Number of scanlines - default: 450
- **noise_amount** (0.0-0.3): TV static intensity - default: 0.08
- **distortion_strength** (0.0-0.15): Screen ripple effect - default: 0.05
- **chromatic_aberration** (0.0-5.0): Color separation - default: 1.5
- **brightness** (0.5-1.5): Overall brightness - default: 1.1
- **contrast** (0.5-2.0): Color contrast - default: 1.2
- **saturation** (0.0-2.0): Color saturation - default: 1.1

## Tips

- For a more subtle effect, reduce `scanline_intensity` and `noise_amount`
- Increase `scanline_count` for higher resolution displays
- Adjust `chromatic_aberration` for more or less color fringing
- Use negative `scanline_speed` to reverse scanline direction

## Compatibility

- Godot 4.x (uses canvas_item shader)
- Works with 2D and UI elements
- Optimized for real-time performance

## License

MIT License - Free to use in any project, commercial or personal.

## Credits

Created for the RetroEDIT project - a writer's sanctuary with authentic retro aesthetics.
