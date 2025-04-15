import numpy as np
import matplotlib.pyplot as plt

# Transfer function: G(s) = 10 / (0.1s + 1)
K = 10
tau = 0.1
omega = np.logspace(-1, 3, 500)  # frequency range: 0.1 to 100 rad/s
omega_c = 1 / tau  # corner frequency

# Magnitude in dB (exact and asymptotic)
mag = 20 * np.log10(K / np.sqrt((tau * omega) ** 2 + 1))
mag_asymptotic = np.piecewise(
    omega,
    [omega < omega_c, omega >= omega_c],
    [lambda w: 20 * np.log10(K), lambda w: 20 * np.log10(K) - 20 * np.log10(w / omega_c)],
)

# Phase in degrees (exact and asymptotic)
phase = -np.arctan(tau * omega) * 180 / np.pi
phase_asymptotic = np.piecewise(
    omega,
    [omega < 0.1 * omega_c, (omega >= 0.1 * omega_c) & (omega <= 10 * omega_c), omega > 10 * omega_c],
    [0, lambda w: -45 - 45 * np.log10(w / omega_c), -90],
)

# Plotting
fig, axs = plt.subplots(2, 1, figsize=(10, 8))

# Magnitude plot
axs[0].semilogx(omega, mag, label='Exact', linewidth=2)
axs[0].semilogx(omega, mag_asymptotic, '--', label='Asymptotic', linewidth=2)
axs[0].set_title('Bode Plot (Magnitude)')
axs[0].set_ylabel('Magnitude (dB)')
axs[0].grid(True, which='both', ls='--')
axs[0].legend()

# Phase plot
axs[1].semilogx(omega, phase, label='Exact', linewidth=2)
axs[1].semilogx(omega, phase_asymptotic, '--', label='Asymptotic', linewidth=2)
axs[1].set_title('Bode Plot (Phase)')
axs[1].set_ylabel('Phase (degrees)')
axs[1].set_xlabel('Frequency (rad/s)')
axs[1].grid(True, which='both', ls='--')
axs[1].legend()

plt.tight_layout()
plt.show()

