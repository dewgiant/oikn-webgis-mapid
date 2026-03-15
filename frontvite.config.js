import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    port: 3000,
    proxy: {
      '/geoserver': { target: 'http://localhost:8080', changeOrigin: true },
      '/geonetwork': { target: 'http://localhost:8081', changeOrigin: true }
    }
  },
  build: { outDir: 'dist' }
})
