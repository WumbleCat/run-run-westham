import type { Config } from 'tailwindcss';

const config: Config = {
  content: ['./app/**/*.{ts,tsx}', './components/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        // Proximity bands: near (<25m), mid (25-50m), far (50-100m), out (>100m)
        proximity: {
          near: '#22d3ee',
          mid: '#38bdf8',
          far: '#6366f1',
          out: '#475569',
        },
        surface: {
          base: '#070b18',
          raised: '#0f172b',
          sunken: '#050813',
        },
        brand: {
          DEFAULT: '#7c3aed',
          soft: '#a78bfa',
        },
      },
      fontFamily: {
        display: ['"Trebuchet MS"', 'Verdana', 'sans-serif'],
      },
      keyframes: {
        sweep: {
          '0%': { transform: 'rotate(0deg)' },
          '100%': { transform: 'rotate(360deg)' },
        },
        'ping-soft': {
          '0%': { transform: 'scale(0.85)', opacity: '0.55' },
          '100%': { transform: 'scale(1.35)', opacity: '0' },
        },
      },
      animation: {
        sweep: 'sweep 4s linear infinite',
        'ping-soft': 'ping-soft 2.4s cubic-bezier(0, 0, 0.2, 1) infinite',
      },
    },
  },
  plugins: [],
};

export default config;
