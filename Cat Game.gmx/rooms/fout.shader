float2 vec2(float2 x0)
{
    return float2(x0);
}
// Varyings
static float2 _v_texcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _gm_AlphaRefValue : register(c3);
uniform bool _gm_AlphaTestEnabled : register(c4);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c5);
uniform bool _gm_PS_FogEnabled : register(c6);
uniform float2 _mouse_pos : register(c7);
uniform float _radial_blur_offset : register(c8);
uniform float _radial_brightness : register(c9);
uniform float2 _resolution : register(c10);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
;
;
void gl_main()
{
{
float2 _uv = vec2(_v_texcoord);
float2 _radial_size = vec2((1.0 / _resolution));
(_radial_size.x *= (_resolution.x / _resolution.y));
float2 _radial_origin = vec2((_mouse_pos / _resolution));
float4 _colour = float4(0.0, 0.0, 0.0, 0.0);
float _blur_amount = 30.0;
(_uv += ((_radial_size * 0.5) - _radial_origin));
{for(float _i = 0.0; (_i < _blur_amount); (_i++))
{
{
float _offset = (1.0 - (_radial_blur_offset * (_i / (_blur_amount - 1.0))));
(_colour += gl_texture2D(_gm_BaseTexture, ((_uv * _offset) + _radial_origin)));
}
;}
}
;
(gl_Color[0] = ((_colour / (_blur_amount - 1.0)) * _radial_brightness));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_texcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
