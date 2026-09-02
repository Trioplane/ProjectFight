# Movement Types
This controls how projectiles move.

Movement types should **only** modify the final velocity, 

The function `pf:sdk/api/projectile/apply_velocity` is always ran at the end of every movement type step. This should not be called inside the movement type definitions unless you know what you are doing.