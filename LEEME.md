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

## Supabase: ranking do reto diario

O ranking vai no teu proxecto **xogos**, coa táboa `avp_reto` (prefixo `avp_`). Só funciona na versión publicada en Vercel, non no artefacto de claude.ai.

1. Entra en supabase.com e abre o proxecto **xogos**.
2. No menú da esquerda, **SQL Editor** → **New query**.
3. Abre `avp_reto.sql` (desta carpeta) cun editor de texto, copia todo, pégao e preme **Run**. Debe saír «Success. No rows returned».
4. En **Table Editor** comproba que aparece a táboa `avp_reto`.
5. Vai a **Project Settings → API Keys** e copia a chave pública: «anon public» (ou «Publishable key»). Esa pode ir no código. **Nunca** uses a «service_role» nin a «secret».
6. A chave pública xa vai metida en `index.html` e `ranking.html`: non tes que tocar nada.
7. Publica de novo con `vercel --prod`.
8. Proba: xoga o reto diario, envía o teu alcume e abre `https://aviondepapel.vercel.app/ranking.html`.

Seguridade: calquera pode ler o ranking e engadir o seu resultado de hoxe (un por persoa e día), pero ninguén pode editar nin borrar desde o xogo.

## Para cagando

- Icono: `aviondepapel.png` (512×512, coas esquinas redondeadas).
- Cor de post-it proposta: `#5B8F7B` (verde da paleta do xogo).
- Ligazón: https://aviondepapel.vercel.app (ou o nome que escollas no paso 6).
- Ranking para o panel: `https://aviondepapel.vercel.app/ranking.html?lang=gl&n=10`
  - `lang`: gl, es, ca ou eu (por defecto gl)
  - `n`: cantos postos mostrar (por defecto 10)
  - `p`: `hoxe` (por defecto), `onte` ou unha data `AAAA-MM-DD`
  - `v`: non se usa (só hai un ranking, o do reto diario)

## Notas

- A partida gárdase no navegador de cada persoa (localStorage). Ao cambiar de dominio (de claude.ai a Vercel) a partida empeza de novo.
- O ficheiro pesa uns 5 MB polas ilustracións; a primeira carga no móbil pode tardar un par de segundos.
