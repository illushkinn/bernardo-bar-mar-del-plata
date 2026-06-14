# 🚀 Migración a Astro - Plan & Beneficios

## ¿Por qué Astro para Cantina Bernardo?

### ✅ Beneficios Inmediatos

1. **Performance Superior**
   - Zero JavaScript por defecto (solo carga lo necesario)
   - Carga 40-60% más rápida que sitios tradicionales
   - Score perfecto en PageSpeed Insights

2. **DRY Code Real**
   - Componentes reutilizables (.astro)
   - No más copiar/pegar HTML
   - Fácil mantenimiento

3. **Gestión de Contenido**
   - Markdown para contenido estático
   - JSON/YAML para datos estructurados
   - CMS integration fácil (Decap, Sanity, etc.)

4. **Optimización Automática**
   - Imágenes optimizadas con `<Image />`
   - CSS con scope automático
   - Build minificado

5. **Escalabilidad**
   - Agregar React/Vue/Svelte cuando necesites
   - Blog con Markdown out-of-the-box
   - API routes para formularios

### ⚠️ Consideraciones

- Requiere Node.js instalado
- Build step necesario (npm run build)
- Curva de aprendizaje mínima (1-2 horas)

---

## 📋 Plan de Migración (45 min)

### Fase 1: Setup (10 min)
```bash
# Crear proyecto Astro
npm create astro@latest cantina-bernardo-astro

# Opción alternativa: migrar carpeta actual
cd bernardo-bar
npm init astro
```

### Fase 2: Estructura de Componentes (15 min)
```
src/
├── components/
│   ├── Navbar.astro
│   ├── Hero.astro
│   ├── MenuSection.astro
│   ├── MenuItem.astro
│   ├── ReviewCard.astro
│   ├── InfoCard.astro
│   └── Footer.astro
├── layouts/
│   └── BaseLayout.astro
├── pages/
│   └── index.astro
└── data/
    ├── menu.json
    └── reviews.json
```

### Fase 3: Migración de Componentes (15 min)
- Convertir secciones HTML a componentes .astro
- Aplicar props para datos dinámicos
- Integrar JSON data

### Fase 4: Optimizaciones (5 min)
- Usar `<Image />` para imágenes
- Configurar sitemap
- SEO metadata

---

## 🎨 Ejemplo: Antes vs Después

### Antes (HTML puro)
```html
<!-- Repetido 6 veces en index.html -->
<article class="review-card">
    <div class="stars">★★★★★</div>
    <h3>Excelente cantina del barrio</h3>
    <p>Fuimos con mi pareja y quedamos fascinados...</p>
    <div class="review-author">
        <img src="assets/images/avatar-1.jpg" alt="Lucas Fernández">
        <div>
            <p class="name">Lucas Fernández</p>
            <p class="source">Google Maps</p>
        </div>
    </div>
</article>
```

### Después (Astro)
```astro
---
// src/components/ReviewCard.astro
const { review } = Astro.props;
const stars = '★'.repeat(review.rating);
---

<article class="review-card">
    <div class="stars">{stars}</div>
    <h3>{review.title}</h3>
    <p>{review.text}</p>
    <div class="review-author">
        <img src={`/images/${review.avatar}`} alt={review.author}>
        <div>
            <p class="name">{review.author}</p>
            <p class="source">{review.source}</p>
        </div>
    </div>
</article>
```

```astro
---
// src/pages/index.astro - Uso
import ReviewCard from '../components/ReviewCard.astro';
import reviews from '../data/reviews.json';
---

{reviews.reviews.map(review => (
    <ReviewCard review={review} />
))}
```

**Reducción de código: ~400 líneas → ~50 líneas**

---

## 🔄 Migración Paso a Paso

### 1. Instalar Astro
```bash
npm create astro@latest
# Elegir:
# - Empty template
# - TypeScript: No (o Sí si prefieres)
# - Instalar dependencias: Yes
```

### 2. Copiar Assets
```bash
# Copiar imágenes
cp -r assets public/

# Copiar datos
cp -r data src/
```

### 3. Crear Layout Base
```astro
---
// src/layouts/BaseLayout.astro
const { title, description } = Astro.props;
---

<!DOCTYPE html>
<html lang="es-AR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <meta name="description" content={description}>
    <link rel="stylesheet" href="/styles/global.css">
</head>
<body>
    <slot />
</body>
</html>
```

### 4. Componentizar Navbar
```astro
---
// src/components/Navbar.astro
const navLinks = [
    { href: '#menu', label: 'Menú' },
    { href: '#reviews', label: 'Reseñas' },
    { href: '#info', label: 'Info' },
    { href: '#contacto', label: 'Contacto' }
];
---

<nav id="navbar">
    <div class="container">
        <a href="#home" class="logo">
            <img src="/images/logo.png" alt="Cantina Bernardo">
        </a>
        <div class="nav-links">
            {navLinks.map(link => (
                <a href={link.href}>{link.label}</a>
            ))}
        </div>
    </div>
</nav>

<style>
    /* Copiar estilos del navbar desde style.css */
</style>

<script>
    // Script del navbar scroll
</script>
```

### 5. Menú Dinámico
```astro
---
// src/components/MenuSection.astro
import MenuItem from './MenuItem.astro';
import menuData from '../data/menu.json';

const currentCategory = menuData.categories[0];
---

<section id="menu" class="menu-section">
    <div class="container">
        <!-- Categorías -->
        <div class="menu-categories">
            {menuData.categories.map(cat => (
                <button class="category-btn" data-category={cat.id}>
                    {cat.name}
                </button>
            ))}
        </div>

        <!-- Items -->
        <div class="menu-items">
            {currentCategory.items.map(item => (
                <MenuItem item={item} />
            ))}
        </div>
    </div>
</section>
```

### 6. Build & Deploy
```bash
# Desarrollo
npm run dev

# Build para producción
npm run build

# Preview
npm run preview
```

---

## 📊 Comparativa

| Aspecto | HTML Actual | Con Astro |
|---------|-------------|-----------|
| Líneas de código | ~600 HTML | ~200 .astro |
| Mantenibilidad | Media | Alta |
| Performance | Buena | Excelente |
| SEO | Bueno | Excelente |
| Escalabilidad | Limitada | Alta |
| Curva aprendizaje | - | Baja |
| Tiempo migración | - | 45 min |
| Build necesario | No | Sí |

---

## 🎯 Cuándo Migrar

### Migrar AHORA si:
- ✅ Querés agregar blog/noticias
- ✅ El menú cambia seguido
- ✅ Planeás escalar features
- ✅ Querés mejor SEO/performance
- ✅ Te gusta trabajar con componentes

### Quedarte con HTML si:
- ❌ El sitio es 100% estático (no cambia nunca)
- ❌ No tenés Node.js ni querés instalarlo
- ❌ Necesitás simpleza absoluta
- ❌ No planeás agregar features

---

## 💡 Recomendación Final

**Para Cantina Bernardo:** 

Dado que:
1. Ya tenemos el JSON system funcionando
2. El sitio funciona perfecto
3. Es un MVP rápido

**Recomiendo:**
- ✅ **Lanzar con HTML puro ahora**
- ✅ **Migrar a Astro en 1-2 meses** si:
  - Agregan blog/eventos
  - Necesitan CMS
  - Quieren mejor performance

**Best of both worlds:** El código actual ya está DRY y listo para migrar fácilmente cuando quieras.

---

## 🚀 Script de Migración Automática

Si decidís migrar, puedo crear un script que:
1. Genere estructura de carpetas Astro
2. Convierta secciones HTML a componentes
3. Migre estilos a scoped CSS
4. Configure build optimizado

**Tiempo estimado:** 30 minutos de script + 15 min de testing

¿Querés que lo prepare?
