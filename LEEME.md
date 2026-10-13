# Avión de papel — como publicalo en Vercel

Esta carpeta xa está lista: `index.html` é o xogo completo (as ilustracións van dentro), e o resto son os iconos e o manifesto para que se poida instalar no móbil.

## Opción A: desde o ordenador con Vercel CLI (a máis rápida)

1. Instala Node.js desde https://nodejs.org (versión LTS, todo «Seguinte»).
2. Abre a Terminal (Mac) ou PowerShell (Windows).
3. Instala Vercel CLI: `npm install -g vercel`
4. Entra nesta carpeta: escribe `cd ` (con espazo), arrastra a carpeta á xanela e preme Intro.
5. Escribe `vercel` e preme Intro. A primeira vez pídeche iniciar sesión no navegador.
6. Responde ás preguntas:
   - Set up and deploy? → `Y`
   - Which scope? → a túa conta
   - Link to existing project? → `N`
   - Project name? → `aviondepapel` (será aviondepapel.vercel.app se está libre)
   - In which directory is your code located? → `./` (Intro)
   - Se pregunta por framework ou build: deixa todo baleiro / «Other».
7. Iso crea unha versión de proba. Para publicala de verdade: `vercel --prod`
8. Nas próximas actualizacións, substitúe `index.html` por unha nova versión e repite só `vercel --prod`.

## Opción B: con GitHub

1. Crea un repositorio novo en github.com (por exemplo `aviondepapel`).
2. Na páxina do repositorio: «uploading an existing file» e arrastra todos os ficheiros desta carpeta. Preme «Commit changes».
3. En vercel.com: Add New → Project → Import o repositorio → Deploy.
4. Cada vez que subas un `index.html` novo ao repositorio, Vercel publícao só.

## Para cagando

- Icono: `aviondepapel.png` (512×512, coas esquinas redondeadas).
- Cor de post-it proposta: `#5B8F7B` (verde da paleta do xogo).
- Ligazón: https://aviondepapel.vercel.app (ou o nome que escollas no paso 6).

## Notas

- A partida gárdase no navegador de cada persoa (localStorage). Ao cambiar de dominio (de claude.ai a Vercel) a partida empeza de novo.
- O ficheiro pesa uns 5 MB polas ilustracións; a primeira carga no móbil pode tardar un par de segundos.
