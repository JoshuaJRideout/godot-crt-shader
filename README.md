# Authentic CRT Monitor Shader for Godot 4

A high-quality CRT monitor shader that recreates the authentic look and feel of vintage CRT tube displays.

![CRT Shader Preview](preview.png)

## Features

🎮 **Authentic CRT Effects:**
- **Moving Scanlines** - Realistic scrolling horizontal lines
- **Screen Curvature** - Warps content like real CRT glass
- **Chromatic Aberration** - Color separation at high-contrast edges  
- **Random TV Noise** - Dynamic static that changes over time
- **Enhanced Colors** - Improved brightness, contrast, and saturation
- **Subtle Distortion** - Gentle ripple effects
- **Proper Vignetting** - Natural edge darkening

## Installation

1. Download and extract the files
2. Copy `crt_shader.gdshader` to your project
3. Create a `ColorRect` node covering your screen
4. Apply the shader as a material to the ColorRect
5. Adjust parameters in the Inspector

## Usage

The shader works as a full-screen overlay. Simply:

1. Add a `ColorRect` node as a child of your main scene
2. Set its anchors to fill the screen (anchors_preset = 15)
3. Create a new `ShaderMaterial` and assign `crt_shader.gdshader`
4. Set `mouse_filter = 2` to allow interactions underneath

## Shader Parameters

- **time_speed** (0.1-5.0): Speed of animated effects
- **scanline_speed** (-2.0-2.0): How fast scanlines move
- **scanline_intensity** (0.0-1.0): Visibility of scanlines
- **scanline_count** (200-800): Number of scanlines
- **noise_amount** (0.0-0.3): Amount of TV static
- **distortion_strength** (0.0-0.15): Screen ripple intensity
- **chromatic_aberration** (0.0-5.0): Color fringing amount
- **brightness** (0.5-1.5): Overall screen brightness
- **contrast** (0.5-2.0): Color contrast enhancement
- **saturation** (0.0-2.0): Color saturation boost

## Compatibility

- **Godot Version:** 4.0+
- **Renderer:** Compatible with Forward+ and Mobile renderers
- **Performance:** Optimized for real-time use

## License

MIT License - Free for commercial and personal use.

## Example Scene

A complete example scene is included showing the shader applied to a loading screen with video content.

## Support

This shader was created for the RetroEDIT project. Feel free to modify and improve!

---

**Perfect for:**
- Retro-style games
- Terminal simulations  
- Vintage computer aesthetics
- Loading screens
- Menu systems
- Any project needing authentic CRT monitor feel
