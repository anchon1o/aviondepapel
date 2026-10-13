-- Avión de papel · ranking do reto diario
-- Proxecto Supabase: xogos · prefixo de táboas: avp_
-- Pégao enteiro no SQL Editor de Supabase e preme «Run».

create table if not exists public.avp_reto (
  id          bigint generated always as identity primary key,
  dia         date        not null,
  xogador     uuid        not null,
  nome        text        not null check (char_length(nome) between 2 and 16),
  modalidade  text        not null check (modalidade in ('dist','time','aim')),
  valor       real        not null check (valor >= 0 and valor < 1000),
  cadrados    text        check (char_length(cadrados) <= 16),
  creado      timestamptz not null default now(),
  unique (dia, xogador)            -- un resultado por persoa e día
);

create index if not exists avp_reto_dia_valor on public.avp_reto (dia, valor);

alter table public.avp_reto enable row level security;

-- calquera pode ler o ranking
drop policy if exists "avp_reto ler" on public.avp_reto;
create policy "avp_reto ler" on public.avp_reto
  for select to anon, authenticated using (true);

-- calquera pode engadir o seu resultado, só para hoxe (±1 día polos fusos horarios)
drop policy if exists "avp_reto engadir" on public.avp_reto;
create policy "avp_reto engadir" on public.avp_reto
  for insert to anon, authenticated
  with check (dia between current_date - 1 and current_date + 1);

-- ninguén pode editar nin borrar desde o xogo (non hai políticas de update/delete)
grant select, insert on public.avp_reto to anon, authenticated;
