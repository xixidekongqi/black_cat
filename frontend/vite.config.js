import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// Vite 开发服务器固定使用 5174，日常预览优先使用后端托管地址 8080。
// /api 与 /uploads 代理到后端，保证两个入口使用同一套数据。
export default defineConfig({
  plugins: [vue()],
  build: {
    // 构建后直接更新后端内置静态页面，避免 8080 与 5174 展示新旧两套界面。
    outDir: '../backend/src/main/resources/static',
    emptyOutDir: true
  },
  server: {
    host: true,
    open: false,
    port: 5174,
    strictPort: true,
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8080',
        changeOrigin: true
      },
      '/uploads': {
        target: 'http://127.0.0.1:8080',
        changeOrigin: true
      }
    }
  }
})
