import numpy as np
import matplotlib.pyplot as plt

# 產生三種不同 P5 值對應的增益 K
P5_values = [0.5, 1.0, 2.0]  # 小, 正常, 大
k_base = 1 * 1.25  # k_A1 * 1.25（假設 k_A1 = 1）

omega = np.logspace(-1, 2, 500)
tau = 0.8  # 固定時間常數

# 繪製 Bode Plot - Magnitude only，因為 P5 只影響 K
plt.figure(figsize=(10, 5))

for p5 in P5_values:
    K = k_base * p5
    mag_db = 20 * np.log10(K / np.sqrt((tau * omega) ** 2 + 1))
    plt.semilogx(omega, mag_db, label=f'P5 = {p5}')

plt.title('Bode Magnitude Plot vs P5')
plt.xlabel('Frequency (rad/s)')
plt.ylabel('Magnitude (dB)')
plt.grid(True, which='both', ls='--')
plt.legend()
plt.tight_layout()
plt.show()


# 繪製包含相位圖的 Bode Plot（對應不同 P5 值）
fig, axs = plt.subplots(2, 1, figsize=(10, 8))

for p5 in P5_values:
    K = k_base * p5
    mag_db = 20 * np.log10(K / np.sqrt((tau * omega) ** 2 + 1))
    phase_deg = -np.arctan(tau * omega) * 180 / np.pi

    axs[0].semilogx(omega, mag_db, label=f'P5 = {p5}')
    axs[1].semilogx(omega, phase_deg, label=f'P5 = {p5}')

# Magnitude plot
axs[0].set_title('Bode Plot vs P5')
axs[0].set_ylabel('Magnitude (dB)')
axs[0].grid(True, which='both', ls='--')
axs[0].legend()

# Phase plot
axs[1].set_xlabel('Frequency (rad/s)')
axs[1].set_ylabel('Phase (degrees)')
axs[1].grid(True, which='both', ls='--')
axs[1].legend()

plt.tight_layout()
plt.show()
