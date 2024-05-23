--!native
--!optimize 2
--!strict

--// Types \\--
-- Character Model
export type Character = Model & Instance & {
    Humanoid: Humanoid & {
        Animator: Animator,
    },
    Shirt: Shirt,
    Pants: Pants,
    ["Body Colors"]: BodyColors,
    ["Shirt Graphic"]: ShirtGraphic,
    HumanoidRootPart: Part & {
        Climbing: Sound,
        Died: Sound,
        FreeFalling: Sound,
        GettingUp: Sound,
        Jumping: Sound,
        Landing: Sound,
        Running: Sound,
        Splash: Sound,
        Swimming: Sound,
        RootRigAttachment: Attachment,
    },
    Head: MeshPart & {
        FaceCenterAttachment: Attachment,
        FaceFrontAttachment: Attachment,
        HairAttachment: Attachment,
        HatAttachment: Attachment,
        NeckRigAttachment: Attachment,
        Neck: Motor6D,
    },
    LeftFoot: MeshPart & {
        LeftAnkleRigAttachment: Attachment,
        LeftFootAttachment: Attachment,
        LeftFoot: WrapTarget,
        LeftAnkle: Motor6D,
    },
    RightFoot: MeshPart & {
        RightAnkleRigAttachment: Attachment,
        RightFootAttachment: Attachment,
        RightFoot: WrapTarget,
        RightAnkle: Motor6D,
    },
    LeftLowerLeg: MeshPart & {
        LeftLowerLeg: WrapTarget,
    },
    RightLowerLeg: MeshPart & {
        RightLowerLeg: WrapTarget,
    },
    LeftUpperLeg: MeshPart & {
        LeftUpperLeg: WrapTarget,
    },
    RightUpperLeg: MeshPart & {
        RightUpperLeg: WrapTarget,
    },
    LowerTorso: MeshPart & {
        LowerTorso: WrapTarget,
    },
    UpperTorso: MeshPart & {
        UpperTorso: WrapTarget,
    },
    RightHand: MeshPart & {
        RightHand: WrapTarget,
    },
    LeftHand: MeshPart & {
        LeftHand: WrapTarget,
    },
    RightLowerArm: MeshPart & {
        RightLowerArm: WrapTarget,
    },
    RightUpperArm: MeshPart & {
        RightUpperArm: WrapTarget,
    },
    LeftLowerArm: MeshPart & {
        LeftElbowRigAttachment: Attachment,
        LeftWristAttachment: Attachment,
        LeftLowerArm: WrapTarget,
        LeftElbow: Motor6D,
    },
    LeftUpperArm: MeshPart & {
        LeftElbowRigAttachment: Attachment,
        LeftShoulderAttachment: Attachment,
        LeftShoulderRigAttachment: Attachment,
        LeftUpperArm: WrapTarget,
        LeftShoulder: Motor6D,
    },
}

return nil