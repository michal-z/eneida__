#if defined(VS_FULL_TRIANGLE)

[RootSignature("RootFlags(0)")]
float4 VSFullTriangle(uint VertexID : SV_VertexID) : SV_Position
{
    float2 Pos[3] = { float2(-1.0f, -1.0f), float2(1.0f, -1.0f), float2(0.0f, 1.0f) };
    return float4(Pos[VertexID], 0.0f, 1.0f);
}

#elif defined(PS_DISPLAY)

[RootSignature("RootFlags(0)")]
float4 PSDisplay() : SV_Target0
{
    return float4(0.0f, 0.5f, 0.0f, 1.0f);
}

#endif
