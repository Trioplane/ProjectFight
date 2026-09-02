# Movement Types
This controls how projectiles move.

Movement types should **only** modify the final velocity, then move the projectile by calling `pf:sdk/api/projectile/apply_velocity`.