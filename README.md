# Cantina Bernardo - MVP Pre-Producción

Sitio web limpio y optimizado para Cantina Bernardo en Mar del Plata.

## 📁 Estructura del Proyecto

```
bernardo-bar/
├── assets/
│   └── images/          # Coloca aquí todos los archivos multimedia
│       ├── logo.png
│       ├── hero-video.mp4
│       ├── menu-hero.jpg
│       └── avatar-1.jpg a avatar-6.jpg
├── data/                # ✨ Nuevo: Datos en JSON
│   ├── menu.json        # Menú completo con todas las categorías
│   └── reviews.json     # Reseñas de clientes
├── index.html
├── style.css
├── script.js
├── optimize-video.ps1   # Script para optimizar video
└── README.md
```

## 🎨 Assets Necesarios

### Imágenes requeridas:

1. **logo.png** - Logo de Cantina Bernardo (transparente, ~200x80px)
2. **hero-video.mp4** - Video de fondo para el hero (optimizado, ~10-15s loop)
3. **menu-hero.jpg** - Imagen destacada del menú (~800x600px)
4. **avatar-1.jpg a avatar-6.jpg** - Fotos de clientes para reseñas (100x100px cada una)

### Donde obtenerlos:
- Descarga las imágenes desde la página original de Readdy
- O usa placeholders temporales hasta tener los archivos reales

## 🔧 Cambios Realizados vs Original

### ✅ Eliminado:
- Todos los scripts y estilos de Readdy
- Meta tags innecesarios de preview
- Estilos inline de Goober
- Formulario de contacto complejo
- Código duplicado (DRY aplicado)

### ✨ Agregado:
- CSS limpio y mantenible con variables CSS
- JavaScript vanilla para interactividad
- **Sistema de datos JSON** para menú y reseñas (fácil de actualizar)
- Botones directos a WhatsApp e Instagram
- Smooth scroll y animaciones sutiles
- Menú mobile funcional
- Lazy loading de imágenes
- **Carga dinámica del menú** desde JSON

### 🎯 Optimizaciones:
- HTML semántico y accesible
- CSS modular con variables
- JS sin dependencias externas
- Carga progresiva de contenido
- **Menú editable vía JSON** (no tocar HTML)
- Zoom de video ajustado (1.15x en vez de 1.25x)
- Espaciado mejorado en navbar

## 📱 Contacto Directo

Reemplazado el formulario con:
- **WhatsApp**: Botón directo para reservas
- **Instagram**: Link a @cantinabernardo
- **Google Maps**: Direcciones rápidas

**Nota**: Actualiza el número de WhatsApp en `index.html` (busca `5492235551234`)

## 🚀 Para Producción

### 0. Editar Contenido (Fácil - Sin tocar código)
```bash
# Actualizar menú, precios, categorías
Editar: data/menu.json

# Actualizar reseñas
Editar: data/reviews.json
```

### 1. Optimiza el video:
```bash
# Ejecutar script de optimización (requiere FFmpeg)
powershell -ExecutionPolicy Bypass -File optimize-video.ps1

# Luego actualizar HTML para usar videos optimizados
```

### 2. Minifica archivos:
- CSS: usa `cssnano` o un minificador online
- JS: usa `terser` o similar
- HTML: usa `html-minifier`

### 3. Hosting recomendado:
- **Netlify** (gratis, fácil, con forms integrados)
- **Vercel** (gratis, super rápido)
- **GitHub Pages** (gratis, simple)

### 4. Configura dominio:
- Si tenés `cantinabernardo.com.ar`, apuntalo a tu hosting
- Activa HTTPS automático

### 5. SEO básico:
- Ya incluido: meta tags, structured data, sitemap básico
- Agrega Google Analytics si querés métricas

## 🌐 Despliegue Rápido

### Con Netlify:
1. Arrastrá la carpeta completa a netlify.com/drop
2. Listo, te da una URL automática

### Con GitHub Pages:
1. Subí el código a un repo público
2. Activa Pages en Settings
3. Elige la rama `main` como source

## 📋 Checklist Pre-Lanzamiento

- [ ] Reemplazar todas las imágenes placeholder
- [ ] Actualizar número de WhatsApp real
- [ ] Verificar link de Instagram
- [ ] Confirmar dirección en Google Maps
- [ ] Testear en mobile (Chrome DevTools)
- [ ] Validar HTML (validator.w3.org)
- [ ] Testear velocidad (PageSpeed Insights)
- [ ] Revisar ortografía y precios
- [ ] Probar todos los links
- [ ] Backup del código

## 🎯 Mejoras Futuras (post-MVP)

- Sistema de reservas integrado
- Galería de fotos del lugar
- Menú completo con todas las categorías
- Blog o sección de novedades
- Sistema de newsletter
- Integración con delivery (PedidosYa, Rappi)

## 💡 Notas

- El CSS usa variables para fácil customización de colores
- El JS es vanilla (sin jQuery ni frameworks)
- Mobile-first y responsive
- Accesible (ARIA labels incluidos)
- Performance optimizado

---

**Hecho con masa madre y amor** 🍝
