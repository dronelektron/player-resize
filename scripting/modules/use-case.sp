void UseCase_Resize(int client, int target, float scale) {
    Entity_SetModelScale(target, scale);
    Entity_SetStepSize(target, BASE_STEP_SIZE * scale);
    Entity_SetViewOffsetZ(target, BASE_VIEW_OFFSET_Z * scale);
    MessageLog_PlayerResized(client, target, scale);
}

int UseCase_ChangePitch(int entity, int pitch) {
    float scale = Entity_GetModelScale(entity);
    float pitchFactor = Variable_PitchFactor();
    int offset = RoundFloat(pitchFactor * Logarithm(scale, 2.0));

    return pitch - offset;
}

bool UseCase_IsClient(int entity) {
    return 1 <= entity && entity <= MaxClients;
}
