# 📋 Checklist Pre-Lanzamiento - Cantina Bernardo

## ✅ Completado

- [x] Limpiar HTML de código Readdy
- [x] CSS personalizado y optimizado
- [x] JavaScript funcional (menú mobile, scroll)
- [x] Descargar todos los assets
- [x] Estructura de carpetas
- [x] README con instrucciones

## ⚠️ Ajustes Necesarios

### 1. Información de Contacto
- [ ] **WhatsApp**: Reemplazar `5492235551234` con el número real
  - Buscar en `index.html`: `wa.me/5492235551234`
  - Actualizar en 2 lugares (sección contacto)

### 2. Redes Sociales
- [ ] Verificar que `@cantinabernardo` es el handle correcto de Instagram
- [ ] Si tienen Facebook/TikTok, considerar agregar links

### 3. Contenido del Menú
- [ ] Actualizar precios si están desactualizados
- [ ] Agregar las otras categorías del menú:
  - Provoletas & Empanadas
  - Panchos & Sandwiches
  - Picadas (completas)
  - Cervezas
  - Tragos
  - Vinos
- [ ] Considerar usar un JSON para manejar el menú dinámicamente

### 4. Imágenes Reales
- [ ] Reemplazar avatares de reseñas por fotos genéricas o eliminar imágenes
- [ ] Considerar usar fotos propias del restaurante para el menú
- [ ] Optimizar el video hero (está en 21MB, bajar a ~5MB)

### 5. SEO y Analytics
- [ ] Agregar Google Analytics o similar
- [ ] Configurar Google Search Console
- [ ] Agregar sitemap.xml
- [ ] Configurar robots.txt

### 6. Performance
```bash
# Optimizar video
ffmpeg -i assets/images/hero-video.mp4 -vcodec h264 -crf 28 -preset slow assets/images/hero-video-optimized.mp4

# Convertir a WebM para mejor compresión
ffmpeg -i assets/images/hero-video.mp4 -c:v libvpx-vp9 -crf 35 -b:v 0 assets/images/hero-video.webm
```
- [ ] Ejecutar optimización de video
- [ ] Actualizar HTML para usar formato WebM con fallback MP4
- [ ] Comprimir imágenes JPG adicionales si es necesario

### 7. Testing
- [ ] Testear en Chrome (desktop y mobile)
- [ ] Testear en Safari (iOS)
- [ ] Testear en Firefox
- [ ] Verificar que todos los links funcionan
- [ ] Probar botones de WhatsApp/Instagram
- [ ] Validar formularios si se agregan
- [ ] Probar menú mobile

### 8. Legal y Contenido
- [ ] Agregar página de Política de Privacidad (si capturan datos)
- [ ] Verificar que todas las reseñas son reales o usar genéricas
- [ ] Revisar ortografía en todo el sitio
- [ ] Confirmar que los horarios están actualizados

## 🚀 Deploy

### Opción 1: Netlify (Recomendado)
1. [ ] Crear cuenta en netlify.com
2. [ ] Arrastrar carpeta o conectar GitHub
3. [ ] Configurar dominio personalizado
4. [ ] Activar HTTPS automático
5. [ ] Probar sitio en producción

### Opción 2: Vercel
1. [ ] Crear cuenta en vercel.com
2. [ ] Importar proyecto desde GitHub
3. [ ] Configurar dominio
4. [ ] Deploy automático

### Opción 3: GitHub Pages
1. [ ] Crear repo en GitHub
2. [ ] Push del código
3. [ ] Activar Pages en Settings
4. [ ] Usar dominio custom (opcional)

## 🎯 Post-Lanzamiento

### Semana 1
- [ ] Monitorear analytics
- [ ] Verificar que llegan consultas por WhatsApp
- [ ] Chequear velocidad de carga (PageSpeed Insights)
- [ ] Pedir feedback a clientes

### Mes 1
- [ ] Actualizar menú si hay cambios
- [ ] Agregar más fotos reales del lugar
- [ ] Considerar agregar testimonios nuevos
- [ ] Evaluar tráfico y ajustar estrategia

## 💡 Mejoras Futuras (Backlog)

### Corto Plazo
- [ ] Sistema de reservas online (usar Calendly o similar)
- [ ] Sección "Plato del Día"
- [ ] Galería de fotos del lugar
- [ ] Integración con Google Reviews (mostrar rating en vivo)

### Mediano Plazo
- [ ] Blog/Noticias del restaurante
- [ ] Sistema de newsletter
- [ ] Integración con delivery (PedidosYa, Rappi)
- [ ] Menú descargable en PDF

### Largo Plazo
- [ ] App de fidelización
- [ ] Sistema de pedidos online propio
- [ ] Panel de administración para actualizar menú
- [ ] Multi-idioma (inglés para turistas)

## 📝 Notas

- **Número de WhatsApp**: Formato internacional sin espacios ni guiones
  - Correcto: `5492235551234`
  - Incorrecto: `+54 223 555-1234`

- **Video Hero**: Considerar lazy load o poster image para mejorar carga inicial

- **Backups**: Guardar versión del código antes de cada cambio mayor

---

**Última actualización**: Junio 13, 2026
