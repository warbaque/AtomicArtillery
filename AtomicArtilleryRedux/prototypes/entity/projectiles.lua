local atomic_explosion = table.deepcopy(data.raw.projectile["atomic-rocket"].action)

--same size as the shockwave to follow, needed to get auto-targeting to space shots correctly. Switched to fire because the thermal pulse is also a thing on nukes.
--Finally, by having this here, you get the radar update with everything dying like you expect with a nuke.
local instant_damage = {
    type = "nested-result",
    action = {
        radius = 35,
        type = "area",
        action_delivery = {
            type = "instant",
            target_effects = {
                {
                    type = "damage",
                    damage = { amount = 3000, type = "fire" },
                },
            },
        },
    },
}


table.insert(atomic_explosion.action_delivery.target_effects, 1, instant_damage)

local projectile = table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
projectile.action = atomic_explosion
data:extend({projectile})
