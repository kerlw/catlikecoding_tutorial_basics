Shader "Graph/Point Surface"
{
    Properties
    {
        //_Color ("Color", Color) = (1,1,1,1)
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Smoothness ("Smoothness", Range(0,1)) = 0.5
        //_Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        //Tags { "RenderType"="Opaque" }
        //LOD 200

        CGPROGRAM
        #pragma surface ConfigureSurface Standard fullforwardshadows

        #pragma target 3.0

        //sampler2D _MainTex;

        struct Input {
            float3 worldPos;
        };

        float _Smoothness;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)
        
        void ConfigureSurface (Input input, inout SurfaceOutputStandard surface) {
            surface.Albedo.rg = saturate(input.worldPos.xy * 0.5 + 0.5);
            surface.Smoothness = _Smoothness;
        }

        //void surf (Input IN, inout SurfaceOutputStandard o)
        //{
         //   // Albedo comes from a texture tinted by color
         // //  fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
         //   o.Albedo = c.rgb;
         //   // Metallic and smoothness come from slider variables
         //   o.Metallic = _Metallic;
         //   o.Smoothness = _Smoothness;
         //   o.Alpha = c.a;
        //}
        ENDCG
    }
    FallBack "Diffuse"
}
