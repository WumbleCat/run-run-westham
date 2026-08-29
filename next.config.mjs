/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  eslint: {
    dirs: ['app', 'components', 'lib', 'scripts', 'seed', 'tests'],
  },
  // The API is documented as /v1/... in the skill docs; keep that surface working.
  async rewrites() {
    return [{ source: '/v1/:path*', destination: '/api/:path*' }];
  },
};

export default nextConfig;
