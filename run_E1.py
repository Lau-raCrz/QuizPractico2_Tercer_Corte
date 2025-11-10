from src.Industrial_Robotics_Gym.Environment.Core import Industrial_Robotics_Gym_Env_Cls
from src.RoLE.Parameters import Robot

# Crear el entorno en modo 'Default' (E1) con el robot ABB IRB 120
env = Industrial_Robotics_Gym_Env_Cls(mode='Default', Robot_Str=Robot.ABB_IRB_120_Str)

# Reiniciar el entorno
obs, info = env.reset()

# Ejecutar algunos pasos aleatorios
for _ in range(300):
    action = env.action_space.sample()
    obs, reward, terminated, truncated, info = env.step(action)
    if terminated or truncated:
        obs, info = env.reset()

input("Presiona ENTER para cerrar...")
env.close()
